class CreateMeasures < ActiveRecord::Migration[6.1]
  def change
    create_table :measures do |t|
      t.st_point :coords, null: false, geographic: true
      t.integer  :category, null: false, limit: 1
      t.integer  :location_type, null: false, limit: 1
      t.decimal  :value, null: false, precision: 10, scale: 2

      t.timestamps
    end

    add_index :measures, :category
    add_index :measures, :location_type
    add_index :measures, :coords, using: :gist
  end
end
