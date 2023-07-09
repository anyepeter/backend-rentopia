class NearByPlacesController < ApplicationController
  before_action :set_near_by_place, only: %i[ show update destroy ]

  # GET /near_by_places
  def index
    @near_by_places = NearByPlace.all

    render json: @near_by_places
  end

  # GET /near_by_places/1
  def show
    render json: @near_by_place
  end

  # POST /near_by_places
  def create
    @near_by_place = NearByPlace.new(near_by_place_params)

    if @near_by_place.save
      render json: @near_by_place, status: :created, location: @near_by_place
    else
      render json: @near_by_place.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /near_by_places/1
  def update
    if @near_by_place.update(near_by_place_params)
      render json: @near_by_place
    else
      render json: @near_by_place.errors, status: :unprocessable_entity
    end
  end

  # DELETE /near_by_places/1
  def destroy
    @near_by_place.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_near_by_place
      @near_by_place = NearByPlace.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def near_by_place_params
      params.require(:near_by_place).permit(:name, :distance, :user_id, :house_id)
    end
end
