class ChangeDataTypeForLimitingMag < ActiveRecord::Migration[6.1]
  def change
    change_column :light_pollutions, :limiting_mag, :float
  end
end
