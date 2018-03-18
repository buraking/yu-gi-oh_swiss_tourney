require 'digest'

class User < ApplicationRecord
  validates :name, presence: true
  validates :email,
    presence: true,
    uniqueness: true,
    format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: 'Specify valid email'}
  has_many :matches
  has_many :decks
  has_many :participants
  has_many :tournaments, through: :participants

  def gravatar_url
    "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}?s=30&d=robohash"
  end
end
