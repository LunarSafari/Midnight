class Activity < ApplicationRecord
  belongs_to :goal, optional: true
  belongs_to :user
  has_one :balance_log

  scope :work, -> { where.not(goal_id: nil) }
  scope :leisure, -> { where(goal_id: nil) }

  before_save do
    self.duration = self.ended_at - self.began_at if self.ended_at
  end

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
      user.recalculate_balance
    end
  end

  def leisure?
    goal_id.nil?
  end

  def work?
    goal_id
  end

  def duration
    super.seconds
  end
end
