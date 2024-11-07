class Apprenticeship < ApplicationRecord
  has_many :applications
  belongs_to :employer
end
