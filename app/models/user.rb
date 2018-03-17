class User < ApplicationRecord
  has_many :decks
  has_many :matches
end
