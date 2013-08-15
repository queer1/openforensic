class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.string :name
      t.string :content
      t.integer :investigation_id
      t.integer :user_id

      t.timestamps
    end
  end
end
