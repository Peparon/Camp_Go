class CampSite::UsersController < ApplicationController
  before_action :authenticate_camp_site!

  def index
    @users = User.all

    # @user = User.find(params[:id])
    # @reservations = @user.reservations.includes(:camp_site, :plan)

    # @camp_site = CampSite.find(params[:camp_site_id])
    # @users = @camp_site.reservations.map(&:user)
  end

  def show
    @user = User.find(params[:id])
    @reservations = @user.reservations.where(camp_site: @camp_site)
  end

  private

  def set_camp_site
    @camp_site = CampSite.find(params[:camp_site_id])
  end
end
