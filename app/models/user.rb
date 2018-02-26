class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :role, presence: true, inclusion: { in: %w(employee manager),
    message: "%{value} is not a valid role" }
end
