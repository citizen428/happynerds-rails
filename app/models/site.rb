# frozen_string_literal: true

class Site < ApplicationRecord
  has_many :category_sites
  has_many :categories, through: :category_sites

  validates :name, :description, :url, presence: true

  default_scope { order(name: :asc) }
end
