class QuizController < ApplicationController
  def create
    # question = params[:question]
    # opt1 = params[:option1]
    # opt2 = params[:option2]
    # opt3 = params[:option3]
    # opt4 = params[:option4]
    # @quiz = Quiz.create!(
    #   question: question,
    #   option1: opt1,
    #   option2: opt2,
    #   option3: opt3,
    #   option4: opt4
    # )
    @quiz = Puzzle.new(quiz_params)
   if @quiz.save
      # redirect_to '/'
      render plain: "Success"
    else
      render plain: "Swetha"
    end
  end
  private
  def quiz_params
    params.require(:puzzles).permit(:question, :option1, :option2, :option3, :option4)
  end
end
