class CreateApps < ActiveRecord::Migration[5.1]
  def change
    create_table :apps do |t|
      t.string :title
      t.string :link
      t.string :position
      t.string :category

      t.timestamps
    end
  end
end
