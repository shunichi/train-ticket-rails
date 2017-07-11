class CreateFareRules < ActiveRecord::Migration[5.1]
  def change
    create_table :fare_rules do |t|
      t.integer :fare, null: false
      t.integer :gate1_id, null: false
      t.integer :gate2_id, null: false

      t.timestamps
    end

    add_index :fare_rules, %i(gate1_id gate2_id), unique: true
  end
end
