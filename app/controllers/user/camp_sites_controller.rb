class User::CampSitesController < ApplicationController

  def index
    @camp_sites = CampSite.all
    # @camp_sites = CampSite.page(params[:page]).per(12)

  end

  def show
    @camp_site = CampSite.find(params[:id])
    @plans = @camp_site.plans
  end

end
