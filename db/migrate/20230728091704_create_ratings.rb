class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.references :post, null: false, foreign_key: true
      t.integer :sky_light
      t.integer :sky_clear
      t.integer :sky_extent
      t.integer :accessiblity
      t.integer :convenient

      t.timestamps
    end
  end
end
