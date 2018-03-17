class Tournament < ApplicationRecord
  has_many :rounds
  has_many :matches, through: :rounds
  has_many :winners, through: :matches
  has_many :participants
  has_many :users, through: :participants

  after_create :setup_rounds

  ROUND_MAP = {
    (4..8) => 3,
    (9..16) => 4,
    (17..32) => 5,
    (33..64) => 6,
    (65..128) => 7,
    (129..256) => 8,
    (257..512) => 9
  }.freeze

  private

  def setup_rounds
    ROUND_MAP.each do |range, number_of_rounds|
      next unless range.include?(limit)
      number_of_rounds.times do |number|
        rounds.create(number: number + 1)
      end
    end
  end
end
