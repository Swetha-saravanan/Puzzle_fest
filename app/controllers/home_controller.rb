# frozen_string_literal: true

class HomeController < ApplicationController
  def home; end

  def edit
    render 'home/creategame'
  end

  def load
    render partial: 'form'
  end
end
