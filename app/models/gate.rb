# NOTE: Gate = 改札機のイメージ
class Gate < ApplicationRecord
  FARES = [150, 190]
  FARE_TABLE = {
    1 => {2 => 150, 3 => 190}.freeze,
    2 => {1 => 150, 3 => 150}.freeze,
    3 => {1 => 190, 2 => 150}.freeze,
  }.freeze

  validates :name, presence: true, uniqueness: true
  validates :station_number, presence: true, uniqueness: true

  scope :order_by_station_number, -> { order(:station_number) }

  def exit?(ticket)
    if fare = FARE_TABLE.dig(ticket.entered_gate.station_number, station_number)
      fare <= ticket.fare
    end
  end
end
