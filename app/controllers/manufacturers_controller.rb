class ManufacturersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_manufacturer, only: [:show, :edit, :update, :destroy]
  layout "dashboard"

  # GET /manufacturers
  # GET /manufacturers.json
  def index
    @manufacturers = Manufacturer.all
  end

  # GET /manufacturers/1
  # GET /manufacturers/1.json
  def show
  end

  # GET /manufacturers/new
  def new
    @manufacturer = Manufacturer.new
  end

  # GET /manufacturers/1/edit
  def edit
  end

  # POST /manufacturers
  # POST /manufacturers.json
  def create
    @manufacturer = current_user.manufacturers.build(manufacturer_params)

    respond_to do |format|
      if @manufacturer.save
        @manufacturers = Manufacturer.all
        format.html { redirect_to @manufacturer, notice: 'Vehicule brand was successfully created.' }
        format.json { render :show, status: :created, location: @manufacturer }
        format.js
      else
        format.html { render :new }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /manufacturers/1
  # PATCH/PUT /manufacturers/1.json
  def update
    respond_to do |format|
      if @manufacturer.update(manufacturer_params)
        @manufacturers = Manufacturer.all
        format.html { redirect_to @manufacturer, notice: 'Vehicule brand was successfully updated.' }
        format.json { render :show, status: :ok, location: @manufacturer }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
  end
  # DELETE /manufacturers/1
  # DELETE /manufacturers/1.json
  def destroy
    @manufacturer.destroy
    respond_to do |format|
      format.html { redirect_to manufacturers_url, notice: 'Vehicule brand was successfully destroyed.' }
      format.json { head :no_content }
      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manufacturer
      @manufacturer = Manufacturer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def manufacturer_params
      params.require(:manufacturer).permit(:name)
    end
end
