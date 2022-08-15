# frozen_string_literal: true

class ReportsController < ApplicationController
  def display_reports
    @data_keys = %w[
      January
      February
      March
      April
      May
      June
    ]
    @data_values = [0, 10, 5, 2, 20, 30, 45]
  end

  def check
    user = User.find(session[:id])
    @users_id = user.id
    grandom = params[:g_random].to_i
    input_random = params[:input_random].to_i
    @assessments_id = params[:id]
    if grandom == input_random
       @player_save = Player.create!(
          users_id: @users_id,
          assessments_id: @assessments_id
       )
       if @player_save.save
        render plain:"Have you seen your name in board?"
       end
    else
      redirect_to '/assessments/game_pin'
    end
  end
end
