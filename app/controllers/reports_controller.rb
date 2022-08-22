# frozen_string_literal: true

class ReportsController < ApplicationController
  def display_reports
    @@record = Report.where(users_id: session[:id])
    if @@record
      @@record.all.each do |t|
        @ass_id = t.assessments_id
        p @ass_id
      end
      if @ass_id
        $questions = Puzzle.where(assessments_id: @ass_id)
        # reports = Report.all
        # reports = nil
      end
    end
    render 'assessments/dashboard'
  end

  def display_qtn
    id = params[:id]
    $assessment = Assessment.where(id: id)
    $questions = Puzzle.where(assessments_id: id)
    redirect_to '/game'
  end

  def library
    $questions = nil
    redirect_to '/library'
  end
end
