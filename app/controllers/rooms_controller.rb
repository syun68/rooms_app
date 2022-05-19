class RoomsController < ApplicationController
  protect_from_forgery

  def top
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "ルーム情報を登録しました"
      redirect_to "/"
    else
      render "rooms/new", status: :unprocessable_entity
    end
  end

  def search
    @rooms = Room.where("(address Like?) AND (name Like?) AND (introduction Like?)", "%#{params[:address]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    if @rooms.empty?
      flash[:notice] = "検索結果がありませんでした"
      redirect_to "/"
    end
  end

  def show
    begin
      @room = Room.find(params[:id])
      @user = User.find_by(id: @room.user_id)
      @reservation = Reservation.new
    rescue
      flash[:notice] = "部屋が存在しません"
      redirect_to "/"
    end
  end

  def posts
    @rooms = Room.where(user_id: @current_user.id)
  end

  def reservations
  end

private
  def room_params
    params.require(:room).permit(:name, :introduction, :fee, :address, :image, :user_id)
  end

end
