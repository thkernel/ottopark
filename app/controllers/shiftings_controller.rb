class ShiftingsController < ApplicationController
  before_action :set_shifting, only: [:show, :edit, :update, :destroy]

  # GET /shiftings
  # GET /shiftings.json
  def index
    @shiftings = Shifting.all
  end

  # GET /shiftings/1
  # GET /shiftings/1.json
  def show
  end

  # GET /shiftings/new
  def new
    @shifting = Shifting.new
  end

  # GET /shiftings/1/edit
  def edit
  end

  # POST /shiftings
  # POST /shiftings.json
  def create
    @shifting = Shifting.new(shifting_params)

    respond_to do |format|
      if @shifting.save
        format.html { redirect_to @shifting, notice: 'Shifting was successfully created.' }
        format.json { render :show, status: :created, location: @shifting }
      else
        format.html { render :new }
        format.json { render json: @shifting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shiftings/1
  # PATCH/PUT /shiftings/1.json
  def update
    respond_to do |format|
      if @shifting.update(shifting_params)
        format.html { redirect_to @shifting, notice: 'Shifting was successfully updated.' }
        format.json { render :show, status: :ok, location: @shifting }
      else
        format.html { render :edit }
        format.json { render json: @shifting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shiftings/1
  # DELETE /shiftings/1.json
  def destroy
    @shifting.destroy
    respond_to do |format|
      format.html { redirect_to shiftings_url, notice: 'Shifting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shifting
      @shifting = Shifting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shifting_params
      params.require(:shifting).permit(:motif, :vehicule_id, :departure, :arrival, :description, :status, :user_id)
    end
end
