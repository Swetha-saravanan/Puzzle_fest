$cur_display_question = nil
class QuizController < ApplicationController
  def index
    @quiz = Puzzle.all
  end
  def create
    question = params[:question]
    answer = Array.new
    opt1 = params[:option1]
    answer.push(opt1)
    opt2 = params[:option2]
    answer.push(opt2)
    opt3 = params[:option3]
    answer.push(opt3)
    opt4 = params[:option4]
    answer.push(opt4)
    ans = params[:option]
    btn = params[:button]

    if answer != answer.uniq
      flash[:error] = "Duplicate Options"
    elsif ans==nil
      flash[:error] = "Choose the answer"
    else
    @quiz = Puzzle.create!(
      question: question,
      option1: opt1,
      option2: opt2,
      option3: opt3,
      option4: opt4,
      answer: ans,
      button: btn
    )
      if @quiz.save
        redirect_to '/quiz/creategame'
      else
        render plain: "Swetha"
      end
    end

  end
  def edit
    question = params[:question]
    opt1 = params[:option1]
    opt2 = params[:option2]
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
      redirect_to '/quiz/creategame'
    else
      render plain: "Swetha"
    end
  end
  def display
    id = params[:id]
    quiz= Puzzle.find(id)
    $cur_display_question = quiz
    redirect_to '/game'
  end
  def show
    question = params[:kinds_of_question]
    kind_of_question = Question.create!(
      kind_of_question: question
    )
    if kind_of_question.save
      puts "swetha"
      $cur_display_question = nil
      redirect_to '/game'

    else
      render plain: "fail"
    end
  end
end
