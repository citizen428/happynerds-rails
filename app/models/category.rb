# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :category_sites
  has_many :sites, through: :category_sites

  validates :name, presence: true
end
