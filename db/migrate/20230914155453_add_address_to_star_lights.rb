class AddAddressToStarLights < ActiveRecord::Migration[6.1]
  def change
    add_column :star_lights, :address, :string
  end
end
