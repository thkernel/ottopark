require 'test_helper'

class InsurancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @insurance = insurances(:one)
  end

  test "should get index" do
    get insurances_url
    assert_response :success
  end

  test "should get new" do
    get new_insurance_url
    assert_response :success
  end

  test "should create insurance" do
    assert_difference('Insurance.count') do
      post insurances_url, params: { insurance: { amount_including_tax: @insurance.amount_including_tax, end_date: @insurance.end_date, insurance_number: @insurance.insurance_number, insurer_id: @insurance.insurer_id, pre_tax_amount: @insurance.pre_tax_amount, start_date: @insurance.start_date, status: @insurance.status, user_id: @insurance.user_id, vat_rate: @insurance.vat_rate, vehicule_id: @insurance.vehicule_id } }
    end

    assert_redirected_to insurance_url(Insurance.last)
  end

  test "should show insurance" do
    get insurance_url(@insurance)
    assert_response :success
  end

  test "should get edit" do
    get edit_insurance_url(@insurance)
    assert_response :success
  end

  test "should update insurance" do
    patch insurance_url(@insurance), params: { insurance: { amount_including_tax: @insurance.amount_including_tax, end_date: @insurance.end_date, insurance_number: @insurance.insurance_number, insurer_id: @insurance.insurer_id, pre_tax_amount: @insurance.pre_tax_amount, start_date: @insurance.start_date, status: @insurance.status, user_id: @insurance.user_id, vat_rate: @insurance.vat_rate, vehicule_id: @insurance.vehicule_id } }
    assert_redirected_to insurance_url(@insurance)
  end

  test "should destroy insurance" do
    assert_difference('Insurance.count', -1) do
      delete insurance_url(@insurance)
    end

    assert_redirected_to insurances_url
  end
end
