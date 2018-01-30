class User < ApplicationRecord
  has_secure_password

  has_many :goals
  has_many :activities

  LANGUAGES = {
    en: 0,
    zh_cn: 1
  }.invert

  def current_activity
    activities.where.not(began_at: nil).where(ended_at: nil).first
  end

  def add_balance_for_work activity, seconds
    with_lock do
      change = seconds * ratio

      update(balance: balance + change)
      BalanceLog.create(activity: activity, ratio: ratio, change: change)
    end
  end

  def reduce_balance_for_leisure activity, seconds
    with_lock do
      ratio = 1
      change = -seconds * ratio

      update(balance: balance + change)
      BalanceLog.create(activity: activity, ratio: ratio, change: change)
    end
  end

  def recalculate_balance
    update(balance: activities.sum('duration * ratio'))
  end

  def language_sym
    LANGUAGES[language]
  end

end
