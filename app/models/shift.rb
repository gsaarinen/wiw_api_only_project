class Shift < ApplicationRecord
  # associations
  belongs_to :user

  # validations
  validates :start_time, presence: true
  validates :end_time, presence: true

end
