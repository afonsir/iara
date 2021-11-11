class CreateMeasures < ActiveRecord::Migration[6.1]
  def change
    create_table :measures do |t|
      t.st_point :coords, null: false, geographic: true
      t.integer  :iet_category, null: false, limit: 1
      t.decimal  :iet_value, null: false, precision: 10, scale: 5
      t.integer  :location_type, null: false, limit: 1

      t.timestamps
    end

    add_index :measures, :iet_category
    add_index :measures, :location_type
    add_index :measures, :coords, using: :gist
  end
end
