class BlueprintsController < ApplicationController
  def index
    @blueprints = Blueprint.all
  end

  def new
    @blueprint = Blueprint.new
  end

  def create
    @blueprint = Blueprint.new(params[:blueprint])
    if @blueprint.save
      redirect_to blueprints_path
    else
      render :new
    end
  end
end
