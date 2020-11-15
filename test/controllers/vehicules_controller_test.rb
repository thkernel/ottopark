require 'test_helper'

class VehiculesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicule = vehicules(:one)
  end

  test "should get index" do
    get vehicules_url
    assert_response :success
  end

  test "should get new" do
    get new_vehicule_url
    assert_response :success
  end

  test "should create vehicule" do
    assert_difference('Vehicule.count') do
      post vehicules_url, params: { vehicule: { chassis_number: @vehicule.chassis_number, color: @vehicule.color, geographic_location: @vehicule.geographic_location, immatriculation_number: @vehicule.immatriculation_number, manufacture_date: @vehicule.manufacture_date, mileage: @vehicule.mileage, serial_number: @vehicule.serial_number, statut: @vehicule.statut, uid: @vehicule.uid, user_id: @vehicule.user_id, vehicule_brand_id: @vehicule.vehicule_brand_id, vehicule_model: @vehicule.vehicule_model, vehicule_type_id: @vehicule.vehicule_type_id } }
    end

    assert_redirected_to vehicule_url(Vehicule.last)
  end

  test "should show vehicule" do
    get vehicule_url(@vehicule)
    assert_response :success
  end

  test "should get edit" do
    get edit_vehicule_url(@vehicule)
    assert_response :success
  end

  test "should update vehicule" do
    patch vehicule_url(@vehicule), params: { vehicule: { chassis_number: @vehicule.chassis_number, color: @vehicule.color, geographic_location: @vehicule.geographic_location, immatriculation_number: @vehicule.immatriculation_number, manufacture_date: @vehicule.manufacture_date, mileage: @vehicule.mileage, serial_number: @vehicule.serial_number, statut: @vehicule.statut, uid: @vehicule.uid, user_id: @vehicule.user_id, vehicule_brand_id: @vehicule.vehicule_brand_id, vehicule_model: @vehicule.vehicule_model, vehicule_type_id: @vehicule.vehicule_type_id } }
    assert_redirected_to vehicule_url(@vehicule)
  end

  test "should destroy vehicule" do
    assert_difference('Vehicule.count', -1) do
      delete vehicule_url(@vehicule)
    end

    assert_redirected_to vehicules_url
  end
end
