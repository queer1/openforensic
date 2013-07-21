class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :investigations, :image, :investigationimage
  end
end
