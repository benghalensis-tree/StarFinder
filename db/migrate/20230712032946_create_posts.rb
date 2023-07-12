class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.date :access_date
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :image
      t.integer :view_count

      t.timestamps
    end
  end
end
