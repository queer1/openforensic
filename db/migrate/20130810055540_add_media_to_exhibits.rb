class AddMediaToExhibits < ActiveRecord::Migration
  def change
    add_column :exhibits, :media, :string
  end
end
