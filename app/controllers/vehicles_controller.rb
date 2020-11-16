class VehiclesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  layout "dashboard"

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = Vehicle.all
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle_models = VehicleModel.all
    @parks = Park.all
    role_ids = Role.where("name NOT IN (?)", ["superuser"]).map {|role| role.id}
    @drivers = User.where("role_id IN (?)", role_ids).map {|user| user.profile }
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
    role_ids = Role.where("name NOT IN (?)", ["superuser"]).map {|role| role.id}
    @drivers = User.where("role_id IN (?)", role_ids).map {|user| user.profile }
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(:uid, :vehicle_type_id, :vehicle_brand_id, :vehicle_model, :serial_number, :chassis_number, :immatriculation_number, :color, :manufacture_date, :mileage, :statut, :geographic_location, :user_id)
    end
end
