require 'test_helper'

class VehicleStickersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle_sticker = vehicle_stickers(:one)
  end

  test "should get index" do
    get vehicle_stickers_url
    assert_response :success
  end

  test "should get new" do
    get new_vehicle_sticker_url
    assert_response :success
  end

  test "should create vehicle_sticker" do
    assert_difference('VehicleSticker.count') do
      post vehicle_stickers_url, params: { vehicle_sticker: { amount_including_tax: @vehicle_sticker.amount_including_tax, end_date: @vehicle_sticker.end_date, pre_tax_amount: @vehicle_sticker.pre_tax_amount, reference: @vehicle_sticker.reference, start_date: @vehicle_sticker.start_date, status: @vehicle_sticker.status, user_id: @vehicle_sticker.user_id, vat_rate: @vehicle_sticker.vat_rate, vehicule_id: @vehicle_sticker.vehicule_id } }
    end

    assert_redirected_to vehicle_sticker_url(VehicleSticker.last)
  end

  test "should show vehicle_sticker" do
    get vehicle_sticker_url(@vehicle_sticker)
    assert_response :success
  end

  test "should get edit" do
    get edit_vehicle_sticker_url(@vehicle_sticker)
    assert_response :success
  end

  test "should update vehicle_sticker" do
    patch vehicle_sticker_url(@vehicle_sticker), params: { vehicle_sticker: { amount_including_tax: @vehicle_sticker.amount_including_tax, end_date: @vehicle_sticker.end_date, pre_tax_amount: @vehicle_sticker.pre_tax_amount, reference: @vehicle_sticker.reference, start_date: @vehicle_sticker.start_date, status: @vehicle_sticker.status, user_id: @vehicle_sticker.user_id, vat_rate: @vehicle_sticker.vat_rate, vehicule_id: @vehicle_sticker.vehicule_id } }
    assert_redirected_to vehicle_sticker_url(@vehicle_sticker)
  end

  test "should destroy vehicle_sticker" do
    assert_difference('VehicleSticker.count', -1) do
      delete vehicle_sticker_url(@vehicle_sticker)
    end

    assert_redirected_to vehicle_stickers_url
  end
end
