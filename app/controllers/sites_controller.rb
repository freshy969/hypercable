# frozen_string_literal: true

class SitesController < ApplicationController
  layout "auth"


  def new
    @site = current_user.sites.new
  end

  def create
    @site = current_user.sites.new(site_params)
    if @site.save
      redirect_to snippet_site_path(@site), success: "site created"
    else
      render "new"
    end
  end

  def snippet
    @site = current_user.sites.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:domain, :tracking_id, :timezone)
  end
end