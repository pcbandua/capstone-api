class Employer < ApplicationRecord
  has_many :applications

  has_secure_password
  validates :email, presence: true, uniqueness: true
end
