# frozen_string_literal: true

class HomeController < ApplicationController
  def home_design
    render 'home_design'
  end

  def about
    render 'about'
  end

  def edit
    render 'home/creategame'
  end

  def load
    render partial: 'form'
  end
end
