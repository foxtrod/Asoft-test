class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.datetime :refresh_time
      t.datetime :date_of_upload

      t.timestamps
    end
  end
end
