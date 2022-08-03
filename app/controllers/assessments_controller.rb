class AssessmentsController < ApplicationController
  def display

  end
  def store
    name=params[:name]
    @assessment = Assessment.create!(
      name: name
    )
    if @assessment.save
      session[:cur_assessment] = name
      redirect_to '/quiz/game'
    else
      redirect_to '/quiz/form'
    end
  end
end
