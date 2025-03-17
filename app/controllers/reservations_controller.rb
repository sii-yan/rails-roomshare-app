class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: [:edit, :update, :destroy]
  before_action :set_room, only: [:new, :create]

  def index
    @reservations = current_user.reservations.includes(:room).order(created_at: :desc)
  end

  def edit
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)

    if @reservation.save
      redirect_to reservations_path, notice: "予約が完了しました。"
    else
      @room = @reservation.room
      render "rooms/show", status: :unprocessable_entity
    end
  end
  

  def update
    if @reservation.update(reservation_params)
      redirect_to reservations_path, notice: "予約が更新されました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path, notice: "予約を削除しました"
  end

  def confirm
    @reservation = current_user.reservations.new(reservation_params)
    @room = Room.find_by(id: @reservation.room_id)

    if @reservation.valid?
      render "reservations/confirm" # エラーがなければ予約確認画面へ
    else
      flash.now[:alert] = @reservation.errors.full_messages.join(", ")
      render "rooms/show", status: :unprocessable_entity # エラー時は再予約画面を表示
    end
  end
  

  private

  def set_reservation
    @reservation = current_user.reservations.find(params[:id])
  end

  def set_room
    @room = Room.find(params[:room_id] || params.dig(:reservation, :room_id))
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :person_num, :room_id)
  end
end
