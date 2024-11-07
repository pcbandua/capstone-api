class EmployersController < ApplicationController

  # New Action
  def new
    @employer = Employer.new
    render json: @employer
  end

  # Index Action
  def index
    @employers = Employer.all
    render :index
  end

  # Show Action
  def show
    @employer = Employer.find_by(id: params[:id])
    render :show
  end

  #Create Action
  def create
    @employer = Employer.create(
      email: params[:email],
      password_digest: params[:password_digest],
      company_name: params[:company_name],
      company_logo: params[:company_logo],
      description: params[:description],
      industry: params[:industry],
      website: params[:website],
    )
    render :show
  end

  # Destroy Action

  def destroy
    @employer = Employer.find_by(id: params[:id])

    if @employer
      @employer.destroy
      render json: { message: "Employer account deleted successfully" }, status: :ok
    else
      render json: { error: "Employer account not found" }, status: :not_found
    end
  end

  render json: { messsge: "Employer account successfully deleted" }
end
