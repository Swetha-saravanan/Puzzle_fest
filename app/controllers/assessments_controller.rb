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
      assessment = Assessment.last
      $question_records = Question.where(assessments_id: assessment.id)
      p $question_records
      redirect_to '/quiz/game'
    else
      redirect_to '/quiz/form'
    end
  end
  def quiz
    id = params[:id]
    $record = Puzzle.where(assessments_id:id)
    # $quiz_record = record
    p $record
    redirect_to '/assessments/display_questions'
  end
end
