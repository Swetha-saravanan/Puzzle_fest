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
  def reports_save
    cur_userid = User.find_by(id: session[:users_id])
    id=params[:id]
    answer = params[:user_answer].to_s
    assessments_id = params[:assessments_id]
    record = Puzzle.where(id: id)
  record.each do |t|
    p t.correct_answer.to_s
    correct_answer = t.correct_answer.eql?(answer)
    if correct_answer == true
      @score = 100
    else
      @score = 0
    end
  end
    time_limit = params[:time_limit]
    reports = Report.create!(
      user_answer:answer,
      users_id: 1,
      assessments_id: assessments_id,
      score: @score,
      time_limit: time_limit
    )
    if reports.save
      $record = Puzzle.where("id > ? AND assessments_id = ?", id.to_i, assessments_id)
      redirect_to '/assessments/display_questions'
    else
      redirect_to '/assessments/display_questions'
    end
  end
end