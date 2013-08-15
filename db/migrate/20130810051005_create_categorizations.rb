class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :exhibit_id
      t.integer :category_id
      t.datetime :created_at

      t.timestamps
    end
  end
end
