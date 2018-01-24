class Activity < ApplicationRecord
  belongs_to :goal, optional: true
  belongs_to :user
  has_one :balance_log

  def description
    case
    when leisure?
      "Leisure"
    when work?
      "Working for #{goal.name}"
    end
  end

  def begin
    update(began_at: Time.now)
  end

  def end
    with_lock do
      return if ended_at.present?
      update(ended_at: Time.now)
      update_balance
    end
  end

  def update_balance
    case
    when leisure?
      user.reduce_balance_for_leisure self, duration
    when work?
      user.add_balance_for_work self, duration
    end
  end

  def leisure?
    goal_id.nil?
  end

  def work?
    goal_id
  end

  def duration
    (ended_at - began_at).seconds
  end
end
