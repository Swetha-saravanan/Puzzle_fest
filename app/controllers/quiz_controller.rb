# frozen_string_literal: true

$cur_display_question = nil
class QuizController < ApplicationController
  def index
    quiz = Puzzle.all
    p quiz
    redirect_to '/assessments/display_questions'
  end

  def create
    question = params[:question]
    answer = []
    opt1 = params[:option1]
    answer.push(opt1)
    opt2 = params[:option2]
    answer.push(opt2)
    opt3 = params[:option3]
    answer.push(opt3)
    opt4 = params[:option4]
    answer.push(opt4)
    ans = params[:option]
    images = params[:images]
    time = params[:time]
    @ans = case ans
           when 'a'
             opt1
           when 'b'
             opt2
           when 'c'
             opt3
           when 'd'
             opt4
           end
    if params[:assessments_id]
      @assessment = params[:assessments_id].to_i
    else
      @assessment = Assessment.last
    end
    question_type = Question.last
    if question_type
      case question_type.kind_of_question
      when 'True or false'
        @quiz = Puzzle.create!(
          question: question,
          option1: opt1,
          option2: opt2,
          answer: ans,
          kind_of_question: question_type.kind_of_question,
          assessments_id: @assessment,
          correct_answer: @ans,
          images: images,
          time: time
        )
      when 'Fillup'
        @quiz = Puzzle.create!(
          question: question,
          option1: opt1,
          answer: opt1,
          kind_of_question: question_type.kind_of_question,
          assessments_id: @assessment.id,
          correct_answer: opt1,
          images: images,
          time: time
        )
      else
        if answer != answer.uniq
          flash[:error] = 'Duplicate Options'
        elsif ans.nil?
          flash[:error] = 'Choose the answer'
        else
          @quiz = Puzzle.create!(
            question: question,
            option1: opt1,
            option2: opt2,
            option3: opt3,
            option4: opt4,
            answer: ans,
            kind_of_question: question_type.kind_of_question,
            assessments_id: @assessment.id,
            correct_answer: @ans,
            images: images,
            time: time
          )
        end
      end
    elsif answer != answer.uniq
      flash[:error] = 'Duplicate Options'
    elsif ans.nil?
      flash[:error] = 'Choose the answer'
    else
      @quiz = Puzzle.create!(
        question: question,
        option1: opt1,
        option2: opt2,
        option3: opt3,
        option4: opt4,
        answer: ans,
        assessments_id: @assessment.id,
        correct_answer: @ans,
        images: images,
        time: time
      )
    end
    redirect_to '/game'
  end

  def edit
    question = params[:question]
    opt1 = params[:option1]
    p opt1
    opt2 = params[:option2]
    p opt2
    opt3 = params[:option3]
    opt4 = params[:option4]
    ans = params[:option]
    btn = params[:button]
    @quiz = Puzzle.update(
      question: question,
      option1: opt1,
      option2: opt2,
      option3: opt3,
      option4: opt4,
      answer: ans,
      button: btn
    )
    if @quiz.save
      # redirect_to '/quiz/game'
      render plain: 'Success'
    else
      render plain: 'Swetha'
    end
  end

  def display1
    id = params[:id]
    quiz = Puzzle.find(id.to_i)
    $cur_display_question = quiz
    redirect_to '/game'
  end

  def display
    id = params[:id]
    quiz = Puzzle.find(id.to_i + 1)
    $cur_display_question = quiz
    redirect_to '/game'
  end

  def show
    @question = params[:kind_of_question]
    puts @question
    @assessments = Assessment.last
    p @assessments.id
    @question_save = Question.create!(
      kind_of_question: @question,
      assessments_id: @assessments.id
    )
    if @question_save.save
      $question_records = Question.all
      $cur_display_question = nil
      redirect_to '/game'
    else
      render plain: 'fail'
    end
  end
end
