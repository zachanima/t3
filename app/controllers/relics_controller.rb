class RelicsController < ApplicationController
  def index
    @relics = Relic.all
  end

  def new
    @relic = Relic.new
    Item.salvages.each do |item|
      @relic.materials.new item_id: item.id
    end
    Item.polymers.each do |item|
      @relic.materials.new item_id: item.id
    end
    Item.datacores.each do |item|
      @relic.tools.new item_id: item.id
    end
    Item.tools.each do |item|
      @relic.tools.new item_id: item.id
    end
  end

  def create
    @relic = Relic.new(params[:relic])
    @relic.materials.reject! do |material|
      material.quantity.nil?
    end
    @relic.tools.reject! do |tool|
      tool.quantity.nil?
    end
    if @relic.save
      redirect_to relics_path
    else
      render :new
    end
  end
end
