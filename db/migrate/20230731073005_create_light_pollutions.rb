class CreateLightPollutions < ActiveRecord::Migration[6.1]
  def change
    create_table :light_pollutions do |t|
      t.float :latitude
      t.float :longitude
      t.integer :limitingmag
      t.timestamps
    end
  end
end
