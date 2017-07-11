require 'test_helper'

class FareRuleTest < ActiveSupport::TestCase
  setup do
    @kitasenju = Gate.create!(name: '北千住', station_number: 4)
    @minamisenju = Gate.create!(name: '南千住', station_number: 5)
  end

  test 'gate order' do
    fare_rule = FareRule.new(fare: 150, gate1: @kitasenju, gate2: @minamisenju)
    assert fare_rule.valid?

    fare_rule = FareRule.new(fare: 150, gate1: @minamisenju, gate2: @kitasenju)
    refute fare_rule.valid?
  end
end
