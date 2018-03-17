class Participant < ApplicationRecord
  belongs_to :tournament
  belongs_to :user
end
