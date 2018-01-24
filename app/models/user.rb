class User < ApplicationRecord
  has_secure_password

  has_many :goals
  has_many :activities

  WORK_TO_LEISURE_RATE = 0.5

  def current_activity
    activities.where.not(began_at: nil).where(ended_at: nil).first
  end

  def add_balance_for_work activity, seconds
    with_lock do
      rate = WORK_TO_LEISURE_RATE
      change = seconds * rate

      update(balance: balance + change)
      BalanceLog.create(activity: activity, rate: rate, change: change)
    end
  end

  def reduce_balance_for_leisure activity, seconds
    with_lock do
      rate = 1
      change = -seconds * rate

      update(balance: balance + change)
      BalanceLog.create(activity: activity, rate: rate, change: change)
    end
  end

end
