class ApprenticeshipsController < ApplicationController

  # New Action
  def new
    @application = Application.new
    render json: @application
  end

  # Index Action
  def index
    @apprenticeships = Apprenticeship.all
    render :index
  end

  # Show Action
  def show
    @apprenticeship = Apprenticeship.find_by(id: params[:id])
    render :show
  end

  #Create Action
  def create
    @apprenticeship = Apprenticeship.create(
      employer_id: params[:employer_id],
      title: params[:title],
      summary: params[:summary],
      location_status: params[:location_status],
      skills_required: params[:skills_required],
      qualifications: params[:qualifications],
      holland_code_preference: params[:holland_code_preference],
      compensation: params[:compensation],
      duration: params[:duration],
      positions_available: params[:positions_available],
      national_registered_status: params[:national_registered_status],
    )
    render :show
  end

  # Destroy Action

  def destroy
    @apprenticeship = Apprenticeship.find_by(id: params[:id])

    if @apprenticeship
      @apprenticeship.destroy
      render json: { message: "Apprenticeship deleted successfully" }, status: :ok
    else
      render json: { error: "Apprenticeship not found" }, status: :not_found
    end
  end

  render json: { messsge: "Apprenticeship successfully deleted" }
end
