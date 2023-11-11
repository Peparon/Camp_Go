class User::CampSitesController < ApplicationController

  def index
    @camp_sites = CampSite.all
    # @camp_sites = CampSite.page(params[:page]).per(12)

  end

  def show
    @camp_site = CampSite.find(params[:id])
    # @plans = @camp_site.plans
    # @plan = @camp_site.plan.find(params[:plan_id])

    @reservation = Reservation.new(start_date: Date.today, end_date: Date.today + 1.day)

    render 'show'

  end
    
  def get_plan_details
    @camp_site = CampSite.find(params[:camp_site_id])
    @plan = @camp_site.plans.find(params[:plan_id])

    respond_to do |format|
      format.js # get_plan_details.js.erbを呼び出す
    end
  end

end
