class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :content
      t.integer :investigation_id
      t.integer :user_id
      t.string :playerimage

      t.timestamps
    end
  end
end
