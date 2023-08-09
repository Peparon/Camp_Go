class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_plan, only: [:new, :create]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    @reservation.plan = @plan

    if @reservation.save
      redirect_to reservation_path(@reservation), notice: "予約が完了しました。"
    else
      render :new
    end
  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :guests)
  end

end
