class AddRankToStarLights < ActiveRecord::Migration[6.1]
  def change
    add_column :star_lights, :rank, :integer
  end
end
