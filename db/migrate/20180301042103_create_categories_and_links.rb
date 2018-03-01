class CreateCategoriesAndLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
    end

    create_table :links do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :url, null: false

      t.timestamps
    end

    create_table :category_links do |t|
      t.belongs_to :category, index: true
      t.belongs_to :link, index: true
    end
  end
end
