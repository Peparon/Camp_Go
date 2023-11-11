class CampSite::PlansController < ApplicationController
  before_action :authenticate_camp_site!
  before_action :set_camp_site
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  def index
    @plans = @camp_site.plans
  end
  
  def new
    @plan = @camp_site.plans.build
  end

  def create
    @plan = @camp_site.plans.build(plan_params)
    if @plan.save
      redirect_to camp_site_plan_path(@camp_site, @plan), notice: "作成に成功しました。"
    else
      flash.now[:error] = "作成に失敗しました。以下のエラーメッセージを確認してください。"
      logger.error @plan.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to camp_site_plans_path, notice: "更新に成功しました。"
    else
      logger.error @plan.errors.full_messages
      render :edit
    end
  end

  def destroy
    @plan.destroy
    redirect_to camp_site_plans_path, notice: "削除に成功しました。"
  end

  private

  def set_camp_site
    @camp_site = current_camp_site
  end

  def set_plan
    @plan = Plan.find_by(id: params[:id], camp_site_id: @camp_site.id)
    if @plan.nil?
      flash[:alert] = "プランが見つかりません。"
      logger.error "Plan not found: #{params[:id]}"
      redirect_to camp_site_plans_path(@camp_site)
    end
  end

  def plan_params
    params.require(:plan).permit(:name, :about, :price, :capacity)
  end

end
