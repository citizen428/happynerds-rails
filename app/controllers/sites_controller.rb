class SitesController < ApplicationController
  http_basic_authenticate_with name: Rails.application.secrets.admin_user,
                               password: Rails.application.secrets.admin_pw,
                               except: :index

  def index
    @sites = Site.tagged(params[:type])
  end
end
