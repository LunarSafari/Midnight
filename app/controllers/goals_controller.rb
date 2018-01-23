class GoalsController < ApplicationController
  require_login

  def new
    @goal = Goal.new
  end
end
