class SitesController < ApplicationController
  http_basic_authenticate_with name: Rails.application.secrets.admin_user,
                               password: Rails.application.secrets.admin_pw,
                               except: :index

  def index
    sites = Site.tagged(params[:type])
    expose sites: sites, category: CategoryDecorator.new(params[:type])
  end

  def new
    expose site: Site.new
  end

  def create
    if (site = Site.create(site_params))
      flash[:notice] = "Successfully added #{site.name}"
      redirect_to root_path
    else
      flash.now[:alert] = site.errors.full_messages.to_sentence
      render 'sites/new', locals: site
    end
  end

  private def site_params
    params.require(:site).permit(:name, :description, :url, tags: [])
  end
end
