class AddDefaultValueToViewCount < ActiveRecord::Migration[6.1]
  def change
    change_column_default :posts, :view_count, from: nil, to: 0
  end
end
