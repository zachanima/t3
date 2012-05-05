require 'net/http'
require 'rexml/document'

class ItemsController < ApplicationController
  def index
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
end
