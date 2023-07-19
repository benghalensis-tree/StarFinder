class AddFavoriteCountToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :favorite_count, :integer, default: 0
  end
end
