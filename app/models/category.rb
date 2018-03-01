# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :category_links
  has_many :links, through: :category_links

  validates :name, presence: true
end
