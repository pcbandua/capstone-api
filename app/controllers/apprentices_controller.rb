class ApprenticesController < ApplicationController

  # New Action
  def new
    @apprentice = Apprentice.new
    render json: @apprentice
  end

  def show
    @apprentice = current_user
    pp @apprentice
    render :show
  end

  #Create Action
  def create
    @apprentice = Apprentice.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      address: params[:address],
      education: params[:education],
      holland_code: params[:holland_code],
    )
    if @apprentice.save
      render json: { message: "Apprentice account created successfully" }, status: :created
    else
      render json: { errors: @apprentice.errors.full_messages }, status: :bad_request
    end
  end

  # Destroy Action

  def destroy
    @apprentice = Apprentice.find_by(id: params[:id])

    if @apprentice
      @apprentice.destroy
      render json: { message: "Apprentice account deleted successfully" }, status: :ok
    else
      render json: { error: "Apprentice account not found" }, status: :not_found
    end
  end

  render json: { messsge: "Apprentice account successfully deleted" }
end
