# frozen_string_literal: true

class AssessmentsController < ApplicationController
  def display
    render 'display'
  end

  def library
    render 'library'
  end

  def quiz_design1
    render 'quiz_design1'
  end

  def explore
    render 'explore'
  end

  def game
    render 'game'
  end

  def game_pin
    render 'game_pin'
  end

  def store
    cur_userid = User.find_by(id: session[:id])
    id = params[:id]
    name = params[:name]
    category = params[:category]
    description = params[:description]
    images = params[:images]
    random_no = 6.times.map { rand(10) }.join
    @assessment = Assessment.create!(
      name: name,
      users_id: cur_userid.id,
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
      redirect_to '/game'
    else
      redirect_to '/quiz/form'
    end
  end

  def quiz
    id = params[:id]
    $record = Puzzle.where(assessments_id: id)
    # $quiz_record = record

    # p $record
    redirect_to '/pin'
  end

  def reports_save
    cur_userid = User.find_by(id: session[:id])
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
      users_id: cur_userid.id,
      assessments_id: assessments_id,
      score: @score,
      time_limit: time_limit
    )
    if reports.save
      check(id, assessments_id)
      # $record = Puzzle.where('id > ? AND assessments_id = ?', id.to_i, assessments_id)
    end
  end

  def check(id, assessments_id)
    puzzle_id = id
    ass_id = assessments_id
    $record = Puzzle.where('id > ? AND assessments_id = ?', puzzle_id.to_i, ass_id)
    if $record
      $record.all.each do |t|
        @record = t
      end
      if @record
        p 'helloooooooooooooooooooooooooooooooooooooooooooooooooooooooooo'
        redirect_to '/pin'
      else
        $record = nil
        p 'nulllllllllllllll'
        redirect_to '/dashboard'
      end
    end
  end

  def edit_page
    $puzzles = Puzzle.find_by(id: params[:id])
    p $puzzles.question
    redirect_to '/edit'
  end

  def dashboard
    render 'dashboard'
  end

  def edit
    @find = Puzzle.find(params[:id])
    @question = params[:question]
    @option1 = params[:option1]
    @option2 = params[:option2]
    @option3 = params[:option3]
    @option4 = params[:option4]
    @kind = params[:kind_of_question]
    @answer = params[:answer]
    @assessments_id = params[:assessments_id]
    @corect_ans = params[:correct_answer]
    @time = params[:time]
    @edit_save = case @kind
                 when 'True or false'
                   @find.update!(
                     question: @question,
                     option1: @option1,
                     option2: @option2,
                     answer: @answer,
                     kind_of_question: @kind,
                     assessments_id: @assessments_id,
                     correct_answer: @correct_ans,
                     time: @time
                     # images: params[:images]
                   )
                 when 'Fillup'
                   @find.update!(
                     question: @question,
                     option1: @option1,
                     answer: @option1,
                     kind_of_question: @kind,
                     assessments_id: @assessments_id,
                     correct_answer: @correct_ans,
                     time: @time
                     # images: params[:images]
                   )
                 else
                   @find.update!(
                     question: @question,
                     option1: @option1,
                     option2: @option2,
                     option3: @option3,
                     option4: @option4,
                     # images: params[:images],
                     answer: @answer,
                     kind_of_question: @kind,
                     assessments_id: @assessments_id,
                     correct_answer: @correct_ans,
                     time: @time
                   )
                 end
    $puzzles = nil
    redirect_to '/game'
  end

  def delete
    find = Puzzle.find_by(id: params[:id])
    find.destroy
    redirect_to '/game'
  end

  def quiz_design
    render 'quiz_design'
  end

  def dashboard
    render 'dashboard'
  end

  def displaygame_pin
    render 'gamepin' if $record
  end

  def display_gamepin
    render 'display_gamepin'
  end
end
