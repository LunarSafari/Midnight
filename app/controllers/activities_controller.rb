class ActivitiesController < ApplicationController
  require_login

  def create_for_goal
    goal = current_user.goals.find(params[:id])
    activity = goal.activities.create(user: current_user)
    activity.begin

    redirect_to account_path
  end

  def create_for_leisure
    activity = current_user.activities.create
    activity.begin

    redirect_to account_path
  end

  def end
    activity = current_user.activities.find(params[:id])
    activity.end

    redirect_to account_path
  end
end
