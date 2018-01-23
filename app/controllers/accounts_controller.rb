class AccountsController < ApplicationController
  require_login

  def show
    @goals = current_user.goals
    @current_activity = current_user.current_activity
  end
end
