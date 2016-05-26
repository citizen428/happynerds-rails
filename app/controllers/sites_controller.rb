class SitesController < ApplicationController
  def index
    @sites = Site.tagged(params[:type])
  end
end
