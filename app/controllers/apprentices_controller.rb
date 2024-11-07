class ApprenticesController < ApplicationController

  # New Action
  def new
    @apprentice = Apprentice.new
    render json: @apprentice
  end

  #Create Action
  def create
    @apprentice = Apprentice.create(
      email: params[:email],
      password_digest: params[:password_digest],
      address: params[:address],
      education: params[:education],
      holland_code: params[:holland_code],
    )
    render :show
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
