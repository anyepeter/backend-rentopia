require "test_helper"

class NearByPlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @near_by_place = near_by_places(:one)
  end

  test "should get index" do
    get near_by_places_url, as: :json
    assert_response :success
  end

  test "should create near_by_place" do
    assert_difference("NearByPlace.count") do
      post near_by_places_url, params: { near_by_place: { distance: @near_by_place.distance, house_id: @near_by_place.house_id, name: @near_by_place.name, user_id: @near_by_place.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show near_by_place" do
    get near_by_place_url(@near_by_place), as: :json
    assert_response :success
  end

  test "should update near_by_place" do
    patch near_by_place_url(@near_by_place), params: { near_by_place: { distance: @near_by_place.distance, house_id: @near_by_place.house_id, name: @near_by_place.name, user_id: @near_by_place.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy near_by_place" do
    assert_difference("NearByPlace.count", -1) do
      delete near_by_place_url(@near_by_place), as: :json
    end

    assert_response :no_content
  end
end
