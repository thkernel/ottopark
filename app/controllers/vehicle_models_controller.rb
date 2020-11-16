class VehicleModelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vehicle_model, only: [:show, :edit, :update, :destroy]
  layout "dashboard"


  # GET /vehicle_models
  # GET /vehicle_models.json
  def index
    @vehicle_models = VehicleModel.all
  end

  # GET /vehicle_models/1
  # GET /vehicle_models/1.json
  def show
  end

  # GET /vehicle_models/new
  def new
    @vehicle_types = VehicleType.all
    @manufacturers = Manufacturer.all
    @vehicle_model = VehicleModel.new
  end

  # GET /vehicle_models/1/edit
  def edit
  end

  # POST /vehicle_models
  # POST /vehicle_models.json
  def create
    @vehicle_model = current_user.vehicle_models.build(vehicle_model_params)

    respond_to do |format|
      if @vehicle_model.save
        @vehicle_models = VehicleModel.all
        format.html { redirect_to @vehicle_model, notice: 'Vehicle model was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_model }
        format.js
      else
        format.html { render :new }
        format.json { render json: @vehicle_model.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /vehicle_models/1
  # PATCH/PUT /vehicle_models/1.json
  def update
    respond_to do |format|
      if @vehicle_model.update(vehicle_model_params)
        @vehicle_models = VehicleModel.all
        format.html { redirect_to @vehicle_model, notice: 'Vehicle model was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_model }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_model.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @vehicle_model = VehicleModel.find(params[:vehicle_model_id])
  end

  # DELETE /vehicle_models/1
  # DELETE /vehicle_models/1.json
  def destroy
    @vehicle_model.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_models_url, notice: 'Vehicle model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_model
      @vehicle_model = VehicleModel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_model_params
      params.require(:vehicle_model).permit( :name, :manufacturer_id, :vehicle_type_id)
    end
end
