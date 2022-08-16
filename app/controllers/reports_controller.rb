# frozen_string_literal: true

class ReportsController < ApplicationController
  def display_reports
    @data_keys = [
      January,
      February,
      March,
      April,
      May,
      June
    ]
    @data_values = [0, 10, 5, 2, 20, 30, 45]
  end


end
