class FareRule < ApplicationRecord
  belongs_to :gate1, class_name: 'Gate'
  belongs_to :gate2, class_name: 'Gate'
  validates :fare, presence: true
  validates :gate1, uniqueness: { scope: :gate2 }
  validate :must_have_ordered_gates

  def self.find_by_gates(gate1, gate2)
    g1, g2 = [gate1, gate2].sort_by(&:station_number)
    FareRule.find_by(gate1: g1, gate2: g2)
  end

  private

  def must_have_ordered_gates
    errors.add(:gate1, '駅の順番が不正です') if gate1.station_number >= gate2.station_number
  end
end
