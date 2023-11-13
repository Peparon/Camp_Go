class User::ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new

    @reservation = Reservation.new(start_date: params[:start_date], end_date: params[:end_date])
    @plan = Plan.find(params[:plan_id])
    if params.has_key?('start_date') && params.has_key?('end_date')
      @camp_site = CampSite.find(params[:reservation][:camp_site_id])
      render :new
    else
      @camp_site = CampSite.find(params[:camp_site_id])
    end
  end

  def create
    # plan = Plan.find(params[:plan_id])

    # if current_user == plan.user
    #   flash[:alert] = "オーナーが予約することはできません。"
    # else
    #   start_date = Date.parse(reservation_params[:start_date])
    #   end_date = Date.parse(reservation_params[:end_date])
    #   days = (end_date - start_date).to_i + 1

    #   @reservation = current_user.reservations.build(reservation_params)
    #   @reservation.room = room
    #   @reservation.price = room.price
    #   @reservation.total = room.price * days
    #   @reservation.save

    #   flash[:notice] = "予約が完了しました。"
    # end
    #   redirect_to plan
    

    @reservation = current_user.reservations.build(reservation_params)
    @reservation.plan_id = params[:plan_id]
    if @reservation.save
      redirect_to thanks_reservations_path, notice: "予約が完了しました。"
    else
      render :new
    end
  end

  def thanks; end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

end
