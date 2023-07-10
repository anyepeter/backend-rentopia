class HousesController < ApplicationController
  before_action :set_house, only: %i[ show update destroy ]

  # GET /houses
  def index
    @houses = House.includes(:user, :category, :location, :security, :near_by_places).all
    if @houses
    @houses = @houses.map do |house| 
      {
        user_info: house.user.attributes,
        category_info: house.category.attributes,
        house_info: house.attributes,
        location_info: house.location.attributes,
        security_info: house.security.attributes,
        places_info: house.near_by_places.map(&:attributes)
      }
    end
    render json: @houses, status: :ok
  else
    render json: @houses.errors.full_messages
  end
  end

  # GET /houses/1
  def show
    render json: @house
  end

  # POST /houses
  def create
    @house = House.new(house_params)

    if @house.save
      render json: @house, status: :created, location: @house
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
      params.permit(:title, :number_of_houses, :price, :metal_type, :water_source, :funitures, :user_id, :category_id, 
      location_attributes: [:city, :quater, :longitude, :latitude], 
     security_attributes: [:gate, :securityMan],
     near_by_places_attributes: [:name, :distance, place_attributes: [:name]]
      )
    end
end
