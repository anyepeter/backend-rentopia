class HousesController < ApplicationController
  before_action :set_house, only: %i[ show update destroy ]

  # GET /houses
  def index
    @houses = House.all

    render json: @houses
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
      params.require(:house).permit(:title, :number_of_houses, :price, :metal_type, :water_source, :funitures, :user_id, :category_id, 
      locations: [
        :city, :quater, :longitude, :latitude
    ], 
     security: [:gate, :securityMan]
      )
    end
end
