class DropLightPollutions < ActiveRecord::Migration[6.1]
  def change
    drop_table :light_pollutions
  end
end
