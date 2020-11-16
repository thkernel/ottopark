require 'test_helper'

class VehiculeBrandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicule_brand = vehicule_brands(:one)
  end

  test "should get index" do
    get vehicule_brands_url
    assert_response :success
  end

  test "should get new" do
    get new_vehicule_brand_url
    assert_response :success
  end

  test "should create vehicule_brand" do
    assert_difference('VehiculeBrand.count') do
      post vehicule_brands_url, params: { vehicule_brand: { description: @vehicule_brand.description, name: @vehicule_brand.name, status: @vehicule_brand.status, uid: @vehicule_brand.uid, user_id: @vehicule_brand.user_id } }
    end

    assert_redirected_to vehicule_brand_url(VehiculeBrand.last)
  end

  test "should show vehicule_brand" do
    get vehicule_brand_url(@vehicule_brand)
    assert_response :success
  end

  test "should get edit" do
    get edit_vehicule_brand_url(@vehicule_brand)
    assert_response :success
  end

  test "should update vehicule_brand" do
    patch vehicule_brand_url(@vehicule_brand), params: { vehicule_brand: { description: @vehicule_brand.description, name: @vehicule_brand.name, status: @vehicule_brand.status, uid: @vehicule_brand.uid, user_id: @vehicule_brand.user_id } }
    assert_redirected_to vehicule_brand_url(@vehicule_brand)
  end

  test "should destroy vehicule_brand" do
    assert_difference('VehiculeBrand.count', -1) do
      delete vehicule_brand_url(@vehicule_brand)
    end

    assert_redirected_to vehicule_brands_url
  end
end
