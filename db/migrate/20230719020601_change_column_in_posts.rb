class ChangeColumnInPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :title, false
    change_column_null :posts, :address, false
    change_column_null :posts, :longitude, false
    change_column_null :posts, :latitude, false
  end
end
