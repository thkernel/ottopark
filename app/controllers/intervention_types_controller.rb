class InterventionTypesController < ApplicationController
  before_action :set_intervention_type, only: [:show, :edit, :update, :destroy]

  # GET /intervention_types
  # GET /intervention_types.json
  def index
    @intervention_types = InterventionType.all
  end

  # GET /intervention_types/1
  # GET /intervention_types/1.json
  def show
  end

  # GET /intervention_types/new
  def new
    @intervention_type = InterventionType.new
  end

  # GET /intervention_types/1/edit
  def edit
  end

  # POST /intervention_types
  # POST /intervention_types.json
  def create
    @intervention_type = InterventionType.new(intervention_type_params)

    respond_to do |format|
      if @intervention_type.save
        format.html { redirect_to @intervention_type, notice: 'Intervention type was successfully created.' }
        format.json { render :show, status: :created, location: @intervention_type }
      else
        format.html { render :new }
        format.json { render json: @intervention_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intervention_types/1
  # PATCH/PUT /intervention_types/1.json
  def update
    respond_to do |format|
      if @intervention_type.update(intervention_type_params)
        format.html { redirect_to @intervention_type, notice: 'Intervention type was successfully updated.' }
        format.json { render :show, status: :ok, location: @intervention_type }
      else
        format.html { render :edit }
        format.json { render json: @intervention_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intervention_types/1
  # DELETE /intervention_types/1.json
  def destroy
    @intervention_type.destroy
    respond_to do |format|
      format.html { redirect_to intervention_types_url, notice: 'Intervention type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention_type
      @intervention_type = InterventionType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_type_params
      params.require(:intervention_type).permit(:uid, :name, :status, :description, :user_id)
    end
end
