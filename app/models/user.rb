class User < ApplicationRecord
  has_secure_password

  has_many :goals
  has_many :activities

  def current_activity
    activities.where.not(began_at: nil).where(ended_at: nil).first
  end
end
