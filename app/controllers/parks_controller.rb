class ParksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_park, only: [:show, :edit, :update, :destroy]
  layout "dashboard"

  # GET /parks
  # GET /parks.json
  def index
    @parks = Park.all
  end

  # GET /parks/1
  # GET /parks/1.json
  def show
  end

  # GET /parks/new
  def new
    role_ids = Role.where("name NOT IN (?)", ["superuser"]).map {|role| role.id}
    @recipients = User.where("role_id IN (?)", role_ids).map {|user| user.profile }
    @park = Park.new
  end

  # GET /parks/1/edit
  def edit
    role_ids = Role.where("name NOT IN (?)", ["superuser"]).map {|role| role.id}
    @recipients = User.where("role_id IN (?)", role_ids).map {|user| user.profile }
  end

  # POST /parks
  # POST /parks.json
  def create
    @park = current_user.parks.build(park_params)

    respond_to do |format|
      if @park.save
        @parks = Park.all
        format.html { redirect_to @park, notice: 'Park was successfully created.' }
        format.json { render :show, status: :created, location: @park }
        format.js
      else
        format.html { render :new }
        format.json { render json: @park.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /parks/1
  # PATCH/PUT /parks/1.json
  def update
    respond_to do |format|
      if @park.update(park_params)
        @parks = Park.all
        format.html { redirect_to @park, notice: 'Park was successfully updated.' }
        format.json { render :show, status: :ok, location: @park }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @park.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @park = Park.find(params[:park_id])
  end

  # DELETE /parks/1
  # DELETE /parks/1.json
  def destroy
    @park.destroy
    respond_to do |format|
      format.html { redirect_to parks_url, notice: 'Park was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_park
      @park = Park.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def park_params
      params.require(:park).permit(:name, :capacity, :address, :country, :city, :manager_id, :status, :description)
    end
end
