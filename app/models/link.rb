class Link < ApplicationRecord
  has_many :category_links
  has_many :categories, through: :category_links

  validates :name, :description, :url, presence: true
end