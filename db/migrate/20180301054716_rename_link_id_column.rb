class RenameLinkIdColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :category_sites, :link_id, :site_id
  end
end
