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
  def quiz
    id = params[:id]
    record = Puzzle.where(assessments_id: 1)
    $quiz_record = record
    p $quiz_record
    redirect_to '/assessments/display_questions'
  end
end
