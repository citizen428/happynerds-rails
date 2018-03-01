# frozen_string_literal: true

class SitesController < ApplicationController
  def index
    category = Category.find_by!(name: params[:type])
    render locals: {
      sites: category.sites,
      category: CategoryDecorator.new(category)
    }
  end
end
