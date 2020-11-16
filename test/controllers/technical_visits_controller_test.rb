require 'test_helper'

class TechnicalVisitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @technical_visit = technical_visits(:one)
  end

  test "should get index" do
    get technical_visits_url
    assert_response :success
  end

  test "should get new" do
    get new_technical_visit_url
    assert_response :success
  end

  test "should create technical_visit" do
    assert_difference('TechnicalVisit.count') do
      post technical_visits_url, params: { technical_visit: { amount_including_tax: @technical_visit.amount_including_tax, end_date: @technical_visit.end_date, pre_tax_amount: @technical_visit.pre_tax_amount, reference: @technical_visit.reference, start_date: @technical_visit.start_date, status: @technical_visit.status, user_id: @technical_visit.user_id, vat_rate: @technical_visit.vat_rate, vehicule_id: @technical_visit.vehicule_id } }
    end

    assert_redirected_to technical_visit_url(TechnicalVisit.last)
  end

  test "should show technical_visit" do
    get technical_visit_url(@technical_visit)
    assert_response :success
  end

  test "should get edit" do
    get edit_technical_visit_url(@technical_visit)
    assert_response :success
  end

  test "should update technical_visit" do
    patch technical_visit_url(@technical_visit), params: { technical_visit: { amount_including_tax: @technical_visit.amount_including_tax, end_date: @technical_visit.end_date, pre_tax_amount: @technical_visit.pre_tax_amount, reference: @technical_visit.reference, start_date: @technical_visit.start_date, status: @technical_visit.status, user_id: @technical_visit.user_id, vat_rate: @technical_visit.vat_rate, vehicule_id: @technical_visit.vehicule_id } }
    assert_redirected_to technical_visit_url(@technical_visit)
  end

  test "should destroy technical_visit" do
    assert_difference('TechnicalVisit.count', -1) do
      delete technical_visit_url(@technical_visit)
    end

    assert_redirected_to technical_visits_url
  end
end
