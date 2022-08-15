class PlayController < ApplicationController
  def display
  end
  def display_gamepin
    id=params[:id]
    random_no = 6.times.map { rand(10) }.join
    @game = Game.create!(
      random_no: random_no,
      assessments_id: id
    )
    if @game.save
      $game= Game.last
      redirect_to '/assessments/display_gamepin'
    else
      render plain:"Failure"
    end


  end
end
