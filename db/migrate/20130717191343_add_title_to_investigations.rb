class AddTitleToInvestigations < ActiveRecord::Migration
  def change
    add_column :investigations, :title, :string
  end
end
