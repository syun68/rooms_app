class ReservationsController < ApplicationController
  before_action :authenticate_user, {only: [:new, :create]}

  def reservations
    @reservations = Reservation.all
  end

  def new
    begin
      @reservation = Reservation.new
      @room = Room.find(params[:room_id])
      @user = User.find(@current_user.id)
      @sabun = (Date.parse(params[:finish]) - Date.parse(params[:begin])).to_i
      @total_fee = @room.fee.to_i*@sabun*(params[:number_of_guests]).to_i
      params_check(params[:begin],params[:finish],params[:number_of_guests],params[:room_id])
    rescue
      flash[:notice] = "入力値のいずれかが空です"
      redirect_to "/rooms/#{params[:room_id]}"
    end
  end

  def create
    @reservation = Reservation.new(params_reservation)
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to "/reservations/#{@reservation.id}"
    else
      redirect_to "/rooms/#{@reservation.room_id}"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
  end

  def params_check(start,finish,numbers,room_id)
    require "date"
    if Date.parse(start) <= Date.today
      flash[:notice] = "利用開始日が過去になってます"
      redirect_to "/rooms/#{room_id}"
    elsif Date.parse(finish) <= Date.parse(start)
      flash[:notice] = "利用終了日が利用開始日より過去になってます"
      redirect_to "/rooms/#{room_id}"
    elsif numbers.to_i <= 0
      flash[:notice] = "利用人数が0以下になってます"
      redirect_to "/rooms/#{room_id}"
    end
  end

  private
  def params_reservation
    params.require(:reservation).permit(:begin, :finish, :total_fee, :number_of_guests,  :fee, :room_id, :user_id, :image, :name, :introduction)
  end

end
