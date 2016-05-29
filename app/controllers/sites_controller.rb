class SitesController < ApplicationController
  http_basic_authenticate_with name: Rails.application.secrets.admin_user,
                               password: Rails.application.secrets.admin_pw,
                               except: :index

  def index
    @sites = Site.tagged(params[:type])
  end

  def new
    @site = Site.new
  end

  def create
    if (@site = Site.create(site_params))
      flash[:notice] = "Successfully added #{site_params[:name]}"
      redirect_to root_path
    else
      flash.now[:alert] = @site.errors.full_messages.to_sentence
      render 'sites/new'
    end
  end

  protected

  def site_params
    params.require(:site).permit(:name, :description, :url, tags: [])
  end
end
