class AddMediaHtmlToExhibits < ActiveRecord::Migration
  def change
    add_column :exhibits, :media_html, :string
  end
end
