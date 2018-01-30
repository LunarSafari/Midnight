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

  def index
    @goals = current_user.goals.order(archived: :asc)
  end

  def show
    @goal = current_user.goals.find(params[:id])
    @total_hours = @goal.activities.sum(:duration) / 3600
  end

  def edit
    @goal = current_user.goals.find(params[:id])
  end

  def update
    @goal = current_user.goals.find(params[:id])
    @goal.update(goal_params)
    redirect_to goal_path(@goal)
  end

  def archive
    @goal = current_user.goals.find(params[:id])
    @goal.update(archived: true)
    redirect_to goal_path(@goal)
  end

  def activate
    @goal = current_user.goals.find(params[:id])
    @goal.update(archived: false)
    redirect_to goal_path(@goal)
  end

  private
    def goal_params
      params.require(:goal).permit(:name)
    end
end
