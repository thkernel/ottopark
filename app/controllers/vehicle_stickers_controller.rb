class VehicleStickersController < ApplicationController
  before_action :set_vehicle_sticker, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_stickers
  # GET /vehicle_stickers.json
  def index
    @vehicle_stickers = VehicleSticker.all
  end

  # GET /vehicle_stickers/1
  # GET /vehicle_stickers/1.json
  def show
  end

  # GET /vehicle_stickers/new
  def new
    @vehicle_sticker = VehicleSticker.new
  end

  # GET /vehicle_stickers/1/edit
  def edit
  end

  # POST /vehicle_stickers
  # POST /vehicle_stickers.json
  def create
    @vehicle_sticker = VehicleSticker.new(vehicle_sticker_params)

    respond_to do |format|
      if @vehicle_sticker.save
        format.html { redirect_to @vehicle_sticker, notice: 'Vehicle sticker was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_sticker }
      else
        format.html { render :new }
        format.json { render json: @vehicle_sticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_stickers/1
  # PATCH/PUT /vehicle_stickers/1.json
  def update
    respond_to do |format|
      if @vehicle_sticker.update(vehicle_sticker_params)
        format.html { redirect_to @vehicle_sticker, notice: 'Vehicle sticker was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_sticker }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_sticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_stickers/1
  # DELETE /vehicle_stickers/1.json
  def destroy
    @vehicle_sticker.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_stickers_url, notice: 'Vehicle sticker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_sticker
      @vehicle_sticker = VehicleSticker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_sticker_params
      params.require(:vehicle_sticker).permit(:vehicule_id, :start_date, :end_date, :reference, :pre_tax_amount, :vat_rate, :amount_including_tax, :status, :user_id)
    end
end
