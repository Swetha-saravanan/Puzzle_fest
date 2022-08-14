# frozen_string_literal: true

class AssessmentsController < ApplicationController
  def display
  end

  def store
    cur_userid = User.find_by(id: session[:users_id])
    id = params[:id]
    name = params[:name]
    category = params[:category]
    description = params[:description]
    images = params[:images]
    random_no = 6.times.map { rand(10) }.join
    @assessment = Assessment.create!(
      name: name,
      users_id: id,
      random_no: random_no,
      category: category,
      description: description,
      images: images
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
    redirect_to '/assessments/quiz_design1'
  end

  def edit
    @find= Puzzle.find(params[:id])
    @question = params[:question]
      @option1 = params[:option1]
      @option2 = params[:option2]
      @option3 = params[:option3]
      @option4 = params[:option4]
     @kind = params[:kind_of_question]
     @answer = params[:answer]
     @assessments_id = params[:assessments_id]
     @corect_ans = params[:correct_answer]
    case @kind
    when "Quiz"
    @edit_save =@find.update!(
      question: @question,
      option1: @option1,
      option2: @option2,
      option3: @option3,
      option4: @option4,
      # images: params[:images],
      answer: @answer,
      kind_of_question: @kind,
      assessments_id: @assessments_id,
      correct_answer: @correct_ans
    )
    when "True or false"
    @edit_save = @find.update!(
      question: @question,
      option1: @option1,
      option2:@option2,
      answer: @answer,
      kind_of_question: @kind,
      assessments_id: @assessments_id,
      correct_answer: @correct_ans,
      # images: params[:images]
    )
    when "Fillup"
    @edit_save = @find.update!(
      question: @question,
      option1: @option1,
      answer: @option1,
      kind_of_question: @kind,
      assessments_id: @assessments_id,
      correct_answer: @correct_ans,
      # images: params[:images]
    )
    end
    $puzzles=nil
    redirect_to '/assessments/quiz_design'
    end
  def delete
    find= Puzzle.find_by(id: params[:id])
    find.destroy
    redirect_to 'assessments/quiz_design'

  end

end
