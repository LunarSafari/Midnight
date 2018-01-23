class GoalsController < ApplicationController
  require_login

  def new
    @goal = Goal.new
  end

  def create
    goal = current_user.goals.new(goal_params)
    if goal.save
      redirect_to account_path
    else
      alert goal.errors.full_messages
    end
  end

  private
    def goal_params
      params.require(:goal).permit(:name)
    end
end
