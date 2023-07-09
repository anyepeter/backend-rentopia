require "test_helper"

class HousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @house = houses(:one)
  end

  test "should get index" do
    get houses_url, as: :json
    assert_response :success
  end

  test "should create house" do
    assert_difference("House.count") do
      post houses_url, params: { house: { category_id: @house.category_id, funitures: @house.funitures, location_id: @house.location_id, metal_type: @house.metal_type, number_of_houses: @house.number_of_houses, price: @house.price, security_id: @house.security_id, title: @house.title, user_id: @house.user_id, water_source: @house.water_source } }, as: :json
    end

    assert_response :created
  end

  test "should show house" do
    get house_url(@house), as: :json
    assert_response :success
  end

  test "should update house" do
    patch house_url(@house), params: { house: { category_id: @house.category_id, funitures: @house.funitures, location_id: @house.location_id, metal_type: @house.metal_type, number_of_houses: @house.number_of_houses, price: @house.price, security_id: @house.security_id, title: @house.title, user_id: @house.user_id, water_source: @house.water_source } }, as: :json
    assert_response :success
  end

  test "should destroy house" do
    assert_difference("House.count", -1) do
      delete house_url(@house), as: :json
    end

    assert_response :no_content
  end
end
