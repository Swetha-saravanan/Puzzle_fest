# frozen_string_literal: true

class ReportsController < ApplicationController
  def display_reports
    @data_keys = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
    ]
    @data_values = [0, 10, 5, 2, 20, 30, 45]
  end

  def check
    grandom = params[:g_random].to_i
    input_random = params[:input_random].to_i
    if grandom == input_random
      redirect_to '/assessments/display_questions'
    else
      redirect_to '/assessments/game_pin'
    end
  end
end
