class ApprenticeshipsController < ApplicationController
  before_action :set_apprenticeship, only: %i[ show edit update destroy ]

  # GET /apprenticeships or /apprenticeships.json
  def index
    @apprenticeships = Apprenticeship.all
  end

  # GET /apprenticeships/1 or /apprenticeships/1.json
  def show
  end

  # GET /apprenticeships/new
  def new
    @apprenticeship = Apprenticeship.new
  end

  # GET /apprenticeships/1/edit
  def edit
  end

  # POST /apprenticeships or /apprenticeships.json
  def create
    @apprenticeship = Apprenticeship.new(apprenticeship_params)

    respond_to do |format|
      if @apprenticeship.save
        format.html { redirect_to @apprenticeship, notice: "Apprenticeship was successfully created." }
        format.json { render :show, status: :created, location: @apprenticeship }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @apprenticeship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apprenticeships/1 or /apprenticeships/1.json
  def update
    respond_to do |format|
      if @apprenticeship.update(apprenticeship_params)
        format.html { redirect_to @apprenticeship, notice: "Apprenticeship was successfully updated." }
        format.json { render :show, status: :ok, location: @apprenticeship }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @apprenticeship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apprenticeships/1 or /apprenticeships/1.json
  def destroy
    @apprenticeship.destroy!

    respond_to do |format|
      format.html { redirect_to apprenticeships_path, status: :see_other, notice: "Apprenticeship was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apprenticeship
      @apprenticeship = Apprenticeship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def apprenticeship_params
      params.require(:apprenticeship).permit(:employer_id, :title, :summary, :location_status, :skills_required, :qualifications, :holland_code_preference, :compensation, :duration, :positions_available, :national_recognition)
    end
end
