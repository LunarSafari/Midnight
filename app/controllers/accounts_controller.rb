class AccountsController < ApplicationController
  require_login

  def show
    @goals = current_user.goals.active
    @current_activity = current_user.current_activity
  end
end
