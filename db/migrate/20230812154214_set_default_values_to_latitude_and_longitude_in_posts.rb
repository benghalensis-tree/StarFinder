class SetDefaultValuesToLatitudeAndLongitudeInPosts < ActiveRecord::Migration[6.0] # Railsのバージョンに合わせてください
  def change
    change_column_default :posts, :latitude, 0.0
    change_column_default :posts, :longitude, 0.0
  end
end
