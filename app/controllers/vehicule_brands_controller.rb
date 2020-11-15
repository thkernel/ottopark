class VehiculeBrandsController < ApplicationController
  before_action :set_vehicule_brand, only: [:show, :edit, :update, :destroy]

  # GET /vehicule_brands
  # GET /vehicule_brands.json
  def index
    @vehicule_brands = VehiculeBrand.all
  end

  # GET /vehicule_brands/1
  # GET /vehicule_brands/1.json
  def show
  end

  # GET /vehicule_brands/new
  def new
    @vehicule_brand = VehiculeBrand.new
  end

  # GET /vehicule_brands/1/edit
  def edit
  end

  # POST /vehicule_brands
  # POST /vehicule_brands.json
  def create
    @vehicule_brand = VehiculeBrand.new(vehicule_brand_params)

    respond_to do |format|
      if @vehicule_brand.save
        format.html { redirect_to @vehicule_brand, notice: 'Vehicule brand was successfully created.' }
        format.json { render :show, status: :created, location: @vehicule_brand }
      else
        format.html { render :new }
        format.json { render json: @vehicule_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicule_brands/1
  # PATCH/PUT /vehicule_brands/1.json
  def update
    respond_to do |format|
      if @vehicule_brand.update(vehicule_brand_params)
        format.html { redirect_to @vehicule_brand, notice: 'Vehicule brand was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicule_brand }
      else
        format.html { render :edit }
        format.json { render json: @vehicule_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicule_brands/1
  # DELETE /vehicule_brands/1.json
  def destroy
    @vehicule_brand.destroy
    respond_to do |format|
      format.html { redirect_to vehicule_brands_url, notice: 'Vehicule brand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicule_brand
      @vehicule_brand = VehiculeBrand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicule_brand_params
      params.require(:vehicule_brand).permit(:uid, :name, :description, :status, :user_id)
    end
end
