require 'test_helper'

class ConsumptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consumption = consumptions(:one)
  end

  test "should get index" do
    get consumptions_url
    assert_response :success
  end

  test "should get new" do
    get new_consumption_url
    assert_response :success
  end

  test "should create consumption" do
    assert_difference('Consumption.count') do
      post consumptions_url, params: { consumption: { description: @consumption.description, driver_id: @consumption.driver_id, quantity: @consumption.quantity, status: @consumption.status, uid: @consumption.uid, unit: @consumption.unit, user_id: @consumption.user_id, vehicle_id: @consumption.vehicle_id } }
    end

    assert_redirected_to consumption_url(Consumption.last)
  end

  test "should show consumption" do
    get consumption_url(@consumption)
    assert_response :success
  end

  test "should get edit" do
    get edit_consumption_url(@consumption)
    assert_response :success
  end

  test "should update consumption" do
    patch consumption_url(@consumption), params: { consumption: { description: @consumption.description, driver_id: @consumption.driver_id, quantity: @consumption.quantity, status: @consumption.status, uid: @consumption.uid, unit: @consumption.unit, user_id: @consumption.user_id, vehicle_id: @consumption.vehicle_id } }
    assert_redirected_to consumption_url(@consumption)
  end

  test "should destroy consumption" do
    assert_difference('Consumption.count', -1) do
      delete consumption_url(@consumption)
    end

    assert_redirected_to consumptions_url
  end
end
