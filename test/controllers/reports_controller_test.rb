# frozen_string_literal: true

require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test 'should get display_reports' do
    get reports_display_reports_url
    assert_response :success
  end
end
