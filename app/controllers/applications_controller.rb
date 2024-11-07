class ApplicationsController < ApplicationController

  # Index Action
  def index
    @applications = Application.all
    render :index
  end

  # Show Action
  def show
    @application = Application.find_by(id: params[:id])
    render :show
  end

  def create
    @application = Application.create(
      apprentice_id: params[:apprentice_id],
      apprenticeship_id: params[:apprenticeship_id],
    )
    render :show
  end
end
