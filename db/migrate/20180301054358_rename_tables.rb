class RenameTables < ActiveRecord::Migration[5.1]
  def change
    rename_table :links, :sites
    rename_table :category_links, :category_sites
  end
end
