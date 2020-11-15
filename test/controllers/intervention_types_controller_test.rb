require 'test_helper'

class InterventionTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intervention_type = intervention_types(:one)
  end

  test "should get index" do
    get intervention_types_url
    assert_response :success
  end

  test "should get new" do
    get new_intervention_type_url
    assert_response :success
  end

  test "should create intervention_type" do
    assert_difference('InterventionType.count') do
      post intervention_types_url, params: { intervention_type: { description: @intervention_type.description, name: @intervention_type.name, status: @intervention_type.status, uid: @intervention_type.uid, user_id: @intervention_type.user_id } }
    end

    assert_redirected_to intervention_type_url(InterventionType.last)
  end

  test "should show intervention_type" do
    get intervention_type_url(@intervention_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_intervention_type_url(@intervention_type)
    assert_response :success
  end

  test "should update intervention_type" do
    patch intervention_type_url(@intervention_type), params: { intervention_type: { description: @intervention_type.description, name: @intervention_type.name, status: @intervention_type.status, uid: @intervention_type.uid, user_id: @intervention_type.user_id } }
    assert_redirected_to intervention_type_url(@intervention_type)
  end

  test "should destroy intervention_type" do
    assert_difference('InterventionType.count', -1) do
      delete intervention_type_url(@intervention_type)
    end

    assert_redirected_to intervention_types_url
  end
end
