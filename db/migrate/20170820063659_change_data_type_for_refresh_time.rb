class ChangeDataTypeForRefreshTime < ActiveRecord::Migration[5.1]
  def change
    change_column :admins, :refresh_time, :integer
  end
end
