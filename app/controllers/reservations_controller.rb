class ReservationsController < ApplicationController

  def new_date
  end

  def new_main
    @reservation = Reservation.new
  end

  def confirm
    @reservation = Reservation.new(reservation_params)

  end

  def create
    reservation = Reservation.new(reservation_params)
    reservation.save
    redirect_to thanx_reservations_path
  end

  def thanx
  end

  def index
    @reservation = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    reservation = Reservation.find(params[:id])
    reservation.update(reservation_params)
    redirect_to action: :show
  end

  private
    def reservation_params
     params.require(:reservation).permit(:menu_id, :start_date, :name, :userinfo)
    end

end
