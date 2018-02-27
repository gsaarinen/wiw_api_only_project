class User < ApplicationRecord
  # model associations
  has_many :shifts

  # validations
  validates :name, presence: true
  validates :email, presence: true

  # only allow "employee" or "manager" for role value
  validates :role,
            presence: true,
            inclusion: { in: %w(employee manager),
                         message: "%{value} is not a valid role" }
end
