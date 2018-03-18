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

  def first_name
    name.split.first
  end

  def gravatar_url(size: 30)
    "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}?s=#{size}&d=robohash"
  end
end
