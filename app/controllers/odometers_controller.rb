class OdometersController < ApplicationController
  before_action :set_odometer, only: [:show, :edit, :update, :destroy]

  # GET /odometers
  # GET /odometers.json
  def index
    @odometers = Odometer.all
  end

  # GET /odometers/1
  # GET /odometers/1.json
  def show
  end

  # GET /odometers/new
  def new
    @odometer = Odometer.new
  end

  # GET /odometers/1/edit
  def edit
  end

  # POST /odometers
  # POST /odometers.json
  def create
    @odometer = Odometer.new(odometer_params)

    respond_to do |format|
      if @odometer.save
        format.html { redirect_to @odometer, notice: 'Odometer was successfully created.' }
        format.json { render :show, status: :created, location: @odometer }
      else
        format.html { render :new }
        format.json { render json: @odometer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /odometers/1
  # PATCH/PUT /odometers/1.json
  def update
    respond_to do |format|
      if @odometer.update(odometer_params)
        format.html { redirect_to @odometer, notice: 'Odometer was successfully updated.' }
        format.json { render :show, status: :ok, location: @odometer }
      else
        format.html { render :edit }
        format.json { render json: @odometer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /odometers/1
  # DELETE /odometers/1.json
  def destroy
    @odometer.destroy
    respond_to do |format|
      format.html { redirect_to odometers_url, notice: 'Odometer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_odometer
      @odometer = Odometer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def odometer_params
      params.require(:odometer).permit(:uid, :vehicle_id, :driver_id, :mileage, :unit, :status, :description, :user_id)
    end
end
