# frozen_string_literal: true

require 'test_helper'

class AssessmentsControllerTest < ActionDispatch::IntegrationTest
  test 'should get display' do
    get assessments_display_url
    assert_response :success
  end
end
