require 'test_helper'

class ShiftingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shifting = shiftings(:one)
  end

  test "should get index" do
    get shiftings_url
    assert_response :success
  end

  test "should get new" do
    get new_shifting_url
    assert_response :success
  end

  test "should create shifting" do
    assert_difference('Shifting.count') do
      post shiftings_url, params: { shifting: { arrival: @shifting.arrival, departure: @shifting.departure, description: @shifting.description, motif: @shifting.motif, status: @shifting.status, user_id: @shifting.user_id, vehicule_id: @shifting.vehicule_id } }
    end

    assert_redirected_to shifting_url(Shifting.last)
  end

  test "should show shifting" do
    get shifting_url(@shifting)
    assert_response :success
  end

  test "should get edit" do
    get edit_shifting_url(@shifting)
    assert_response :success
  end

  test "should update shifting" do
    patch shifting_url(@shifting), params: { shifting: { arrival: @shifting.arrival, departure: @shifting.departure, description: @shifting.description, motif: @shifting.motif, status: @shifting.status, user_id: @shifting.user_id, vehicule_id: @shifting.vehicule_id } }
    assert_redirected_to shifting_url(@shifting)
  end

  test "should destroy shifting" do
    assert_difference('Shifting.count', -1) do
      delete shifting_url(@shifting)
    end

    assert_redirected_to shiftings_url
  end
end
