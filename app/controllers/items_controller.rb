require 'net/http'
require 'rexml/document'

class ItemsController < ApplicationController
  def index
    update_values
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

private
  def update_values
    if (items = Item.outdated.collect(&:type_id)).empty?
      return
    end

    url = [
      'http://api.eve-central.com/api/marketstat?typeid=',
      items.join('&typeid='), '&usesystem=30000142'
    ].join

    sell = Array.new
    buy = Array.new
    data = Net::HTTP.get_response(URI.parse(url)).body
    elements = REXML::Document.new(data).elements
    elements.each('/evec_api/marketstat/type/sell/min') do |item|
      sell << item.to_s.gsub(/[^0-9\.]/, '').to_f
    end
    elements.each('/evec_api/marketstat/type/buy/max') do |item|
      buy << item.to_s.gsub(/[^0-9\.]/, '').to_f
    end

    sell.each_index do |i|
      item = Item.find_by_type_id(items[i])
      item.sell = sell[i]
      item.buy = buy[i]
      item.save
    end
  end
end
