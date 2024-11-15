class Apprenticeship < ApplicationRecord
  has_many :applications
  belongs_to :employer

  # has_secure_password
  # validates :email, presence: true, uniqueness: true
end
