require 'test_helper'

class OdometersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @odometer = odometers(:one)
  end

  test "should get index" do
    get odometers_url
    assert_response :success
  end

  test "should get new" do
    get new_odometer_url
    assert_response :success
  end

  test "should create odometer" do
    assert_difference('Odometer.count') do
      post odometers_url, params: { odometer: { description: @odometer.description, driver_id: @odometer.driver_id, mileage: @odometer.mileage, status: @odometer.status, uid: @odometer.uid, unit: @odometer.unit, user_id: @odometer.user_id, vehicle_id: @odometer.vehicle_id } }
    end

    assert_redirected_to odometer_url(Odometer.last)
  end

  test "should show odometer" do
    get odometer_url(@odometer)
    assert_response :success
  end

  test "should get edit" do
    get edit_odometer_url(@odometer)
    assert_response :success
  end

  test "should update odometer" do
    patch odometer_url(@odometer), params: { odometer: { description: @odometer.description, driver_id: @odometer.driver_id, mileage: @odometer.mileage, status: @odometer.status, uid: @odometer.uid, unit: @odometer.unit, user_id: @odometer.user_id, vehicle_id: @odometer.vehicle_id } }
    assert_redirected_to odometer_url(@odometer)
  end

  test "should destroy odometer" do
    assert_difference('Odometer.count', -1) do
      delete odometer_url(@odometer)
    end

    assert_redirected_to odometers_url
  end
end
