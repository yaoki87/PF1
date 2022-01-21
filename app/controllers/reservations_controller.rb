class ReservationsController < ApplicationController
before_action :authenticate_admin!,except: [:new_date, :new_main, :comfirm, :thanx, :show, :calender]

  def new_date
  end

  def new_main
    date = params[:date].split(" ")[2]
    month =  params[:month]
    year = params[:date].split(" ")[3]
    @date = year + "年" + month + "月" + date + "日"
    @reservation = Reservation.new(start_date: params[:date])
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    unless @reservation.valid?
      @date = params[:date]
      render :new_main
    else
      render :confirm
    end
  end

  def create
    reservation = Reservation.new(reservation_params)
    reservation.save!
    redirect_to thanx_reservations_path
  end

  def thanx
  end

  def index
    @reservation_new = Reservation.where(check: "false")
    @reservation_confirmed = Reservation.where(check: "true").order(start_date: :asc)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
    if @reservation.menu == 'カット'
      @reservation.end_date = @reservation.start_date.strftime("%H:%M")
    end
  end

  def update
    reservation = Reservation.find(params[:id])
    reservation.update(reservation_params)
    redirect_to action: :show
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    redirect_to action: :index
  end

  def calender

  end

  private
    def reservation_params
     params.require(:reservation).permit(:menu, :treatment, :start_date, :name, :userinfo, :end_date, :check)
    end

end
