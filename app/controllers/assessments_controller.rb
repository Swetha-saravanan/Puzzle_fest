# frozen_string_literal: true

class AssessmentsController < ApplicationController
  def display
  end

  def store
    name = params[:name]
    random_no = 6.times.map { rand(10) }.join
    @assessment = Assessment.create!(
      name: name,
      random_no: random_no
    )
    if @assessment.save
      session[:cur_assessment] = name
      assessment = Assessment.last
      $question_records = Question.where(assessments_id: assessment.id)
      p $question_records
      redirect_to '/assessments/quiz_design'
    else
      redirect_to '/quiz/form'
    end
  end

  def quiz
    id = params[:id]
    $record = Puzzle.where(assessments_id: id)
    # $quiz_record = record

    # p $record
    redirect_to '/assessments/game_pin'
  end

  def reports_save
    cur_userid = User.find_by(id: session[:users_id])
    id = params[:id]
    answer = params[:user_answer].to_s
    assessments_id = params[:assessments_id]
    record = Puzzle.where(id: id)
    record.each do |t|
      p t.correct_answer.to_s
      correct_answer = t.correct_answer.eql?(answer)
      @score = if correct_answer == true
                 100
               else
                 0
               end
    end
    time_limit = params[:time_limit]
    reports = Report.create!(
      user_answer: answer,
      users_id: 1,
      assessments_id: assessments_id,
      score: @score,
      time_limit: time_limit
    )
    $record = Puzzle.where('id > ? AND assessments_id = ?', id.to_i, assessments_id) if reports.save
    redirect_to '/assessments/display_questions'
  end

  def edit_page
    $puzzles = Puzzle.find_by(id: params[:id])
    p $puzzles.question
    redirect_to '/assessments/quiz_design'
  end

  def edit
    @find= Puzzle.find(params[:id])
    p params[:kind_of_question]
    case params[:kind_of_question]
    when "Quiz"
    @edit_save =@find.update(
      question: params[:question],
      option1: params[:option1],
      option2: params[:option2],
      option3: params[:option3],
      option4: params[:option4],
      # images: params[:images],
      answer: params[:answer],
      kind_of_question: params[:kind_of_question],
      assessments_id: params[:assessments_id],
      correct_answer: params[:correct_answer]
    )
    when "True or false"
    @edit_save = @find.update(
      question: params[:question],
      option1: params[:option1],
      option2: params[:option2],
      answer: params[:answer],
      kind_of_question: params[:kind_of_question],
      assessments_id: params[:assessments_id],
      correct_answer: params[:correct_answer],
      # images: params[:images]
    )
    when "Fillup"
    @edit_save = @find.update(
      question: params[:question],
      option1: params[:option1],
      answer: params[:option1],
      kind_of_question: params[:kind_of_question],
      assessments_id: params[:assessments_id],
      correct_answer: params[:correct_answer],
      # images: params[:images]
    )
    end
    # if @edit_save.save!
    #   redirect_to 'assessments/quiz_design'
    # else
    #   render plain:"Fail"
    # end
  end
  def delete
    find= Puzzle.find(params[:id].to_i)
    find.destroy
    redirect_to 'assessments/quiz_design'

  end

end
