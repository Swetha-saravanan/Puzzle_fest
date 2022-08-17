# frozen_string_literal: true

class ReportsController < ApplicationController
  def display_reports
     id = params[:id]
    $puzzle = User.joins("JOIN reports on reports.users_id = users.id ").map
    Subscription.joins("INNER JOIN plans ON plans.id = subscriptions.plan_id
      INNER JOIN roles ON roles.id = plans.role_id").where("roles.name = 'Gold'").first

    p $puzzle
    # redirect_to '/assessments/dashboard'
  end


end
