# frozen_string_literal: true

class PlayController < ApplicationController
  def display; end

  def display_gamepin
    id = params[:id]
    random_no = 6.times.map { rand(10) }.join
    @game = Game.create!(
      random_no: random_no,
      assessments_id: id
    )
    if @game.save
      $game = Game.last
      redirect_to '/gamepin'
    else
      render plain: 'Failure'
    end
  end

  def host
    id = params[:id]
    $record = Puzzle.where(assessments_id: id)
    count = $record.count
    p count
    redirect_to '/pin'
    # redirect_to '/reports/display_questions'
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
        assessments_id: @assessments_id,
        random_no: grandom
      )
    end
  end
end
