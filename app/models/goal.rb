class Goal < ApplicationRecord
  belongs_to :user
  has_many :activities

  scope :active, -> { where(archived: false) }
end
