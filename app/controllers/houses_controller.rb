class HousesController < ApplicationController
  before_action :set_house, only: %i[ show update destroy ]
  before_action :authorize_request, except: :index
  # GET /houses
  def index
    @houses = House.includes(:user, :category, :location, :security, :near_by_places).all
    
    render json: @houses, include: :user, status: :ok
  end

  # GET /houses/1
  def show
    puts current_user
    render json: @house, include: :user
  end

  # POST /houses
  def create
  
    @house = current_user.houses.build(house_params)

    if @house.save
      render json: @house, status: :created, include: ["user"], location: @house
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /houses/1
  def update
    if @house.update(house_params)
      render json: @house
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  # DELETE /houses/1
  def destroy
    @house.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def house_params
      params.permit(:title, :number_of_houses, :price, :metal_type, :water_source, :funitures, :category_id, :video, images: [],
      location_attributes: [:city, :quater, :longitude, :latitude], 
     security_attributes: [:gate, :securityMan],
     near_by_places_attributes: [:name, :distance, place_attributes: [:name]]
      )
    end
end
