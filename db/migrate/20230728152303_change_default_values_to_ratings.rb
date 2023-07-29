class ChangeDefaultValuesToRatings < ActiveRecord::Migration[6.1]
  def up
    change_column_default :ratings, :sky_light, 0
    change_column_default :ratings, :sky_clear, 0
    change_column_default :ratings, :sky_extent, 0
    change_column_default :ratings, :accessiblity, 0
    change_column_default :ratings, :convenient, 0
  end

  def down
    change_column_default :ratings, :sky_light, nil
    change_column_default :ratings, :sky_clear, nil
    change_column_default :ratings, :sky_extent, nil
    change_column_default :ratings, :accessiblity, nil
    change_column_default :ratings, :convenient, nil
  end
end
