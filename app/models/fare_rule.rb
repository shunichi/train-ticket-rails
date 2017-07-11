class FareRule < ApplicationRecord
  belongs_to :gate1, class_name: 'Gate'
  belongs_to :gate2, class_name: 'Gate'
  validates :fare, presence: true
  validates :gate1, uniqueness: { scope: :gate2 }

  def self.find_by_gates(gate1, gate2)
    g1, g2 = [gate1, gate2].sort_by(&:station_number)
    FareRule.find_by(gate1: g1, gate2: g2)
  end
end
