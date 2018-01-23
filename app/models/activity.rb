class Activity < ApplicationRecord
  belongs_to :goal
  belongs_to :user

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
    update(ended_at: Time.now)
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
