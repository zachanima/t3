class RelicsController < ApplicationController
  def index
    @relics = Relic.all
  end

  def new
    @relic = Relic.new
  end

  def create
    @relic = Relic.new(params[:relic])
    if @relic.save
      redirect_to relics_path
    else
      render :new
    end
  end
end
