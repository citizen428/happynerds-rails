# frozen_string_literal: true

class CategoryLink < ApplicationRecord
  belongs_to :category
  belongs_to :link
end
