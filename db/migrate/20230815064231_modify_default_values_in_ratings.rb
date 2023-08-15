class ModifyDefaultValuesInRatings < ActiveRecord::Migration[6.1]
  def change
    change_column_default :ratings, :sky_light, 3
    change_column_default :ratings, :sky_clear, 3
    change_column_default :ratings, :sky_extent, 3
    change_column_default :ratings, :accessiblity, 3
    change_column_default :ratings, :convenient, 3
  end
end
