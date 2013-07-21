class CreateInvestigations < ActiveRecord::Migration
  def change
    create_table :investigations do |t|
      t.string :content
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
