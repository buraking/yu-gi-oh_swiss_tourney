class Match < ApplicationRecord
  has_one :winner

  belongs_to :challenger, class_name: 'User'
  belongs_to :challenged, class_name: 'User'
  belongs_to :round
end
