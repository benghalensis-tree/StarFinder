class CreateStarLights < ActiveRecord::Migration[6.1]
  def change
    create_table :star_lights do |t|
      t.float :latitude
      t.float :longitude
      t.float :magnitude
      t.timestamps
    end
  end
end
