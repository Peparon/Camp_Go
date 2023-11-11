class CampSite::CampSitesController < ApplicationController
  before_action :authenticate_camp_site!

  def show
    @camp_site = current_camp_site
  end

  def edit
    @camp_site = current_camp_site
  end
  
  # def create
  #   @camp_site = CampSite.new(camp_site_params)
  #   if @camp_site.save
  #     redirect_to camp_site_path(@camp_site), notice: '写真を追加しました。'
  #   else
  #     render "new"
  #   end
  # end

  def update
    @camp_site = current_camp_site
    if @camp_site.update(camp_site_params)
      redirect_to camp_site_camp_site_path(@camp_site), notice: '更新に成功しました。'
    else
      render "edit"
    end
  end

  private

  def camp_site_params
    params.require(:camp_site).permit(:name, :about, :post_code, :address, :phone_number, :email, :password, :password_confirmation, :image,)
  end

end
