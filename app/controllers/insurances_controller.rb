class InsurancesController < ApplicationController
  before_action :set_insurance, only: [:show, :edit, :update, :destroy]

  # GET /insurances
  # GET /insurances.json
  def index
    @insurances = Insurance.all
  end

  # GET /insurances/1
  # GET /insurances/1.json
  def show
  end

  # GET /insurances/new
  def new
    @insurance = Insurance.new
  end

  # GET /insurances/1/edit
  def edit
  end

  # POST /insurances
  # POST /insurances.json
  def create
    @insurance = Insurance.new(insurance_params)

    respond_to do |format|
      if @insurance.save
        format.html { redirect_to @insurance, notice: 'Insurance was successfully created.' }
        format.json { render :show, status: :created, location: @insurance }
      else
        format.html { render :new }
        format.json { render json: @insurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insurances/1
  # PATCH/PUT /insurances/1.json
  def update
    respond_to do |format|
      if @insurance.update(insurance_params)
        format.html { redirect_to @insurance, notice: 'Insurance was successfully updated.' }
        format.json { render :show, status: :ok, location: @insurance }
      else
        format.html { render :edit }
        format.json { render json: @insurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insurances/1
  # DELETE /insurances/1.json
  def destroy
    @insurance.destroy
    respond_to do |format|
      format.html { redirect_to insurances_url, notice: 'Insurance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance
      @insurance = Insurance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def insurance_params
      params.require(:insurance).permit(:insurer_id, :vehicule_id, :start_date, :end_date, :insurance_number, :pre_tax_amount, :vat_rate, :amount_including_tax, :status, :user_id)
    end
end
