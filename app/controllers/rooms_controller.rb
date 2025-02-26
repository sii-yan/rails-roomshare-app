class RoomsController < ApplicationController
  # before_action :set_room, only: [:show, :edit, :update, :destory]

  # def index
  #   @rooms = Room.all
  # end

  # def show
  # end

  # def new
  #   @room = Room.new
  # end

  # def create
  #   @room = Room.new(room_params)
  #   if @room.save
  #     flash[:notice] = "宿泊施設が登録されました。"
  #     redirect_to :@room
  #   else
  #     render :new
  #   end
  # end

  # def edit
  # end

  # def update
  #   if @room.update(room_params)
  #     flash[:notice] = "宿泊施設情報が更新されました。"
  #     redirect_to :@room
  #   else
  #     render :edit
  #   end
  # end

  # def destory
  #   @room.destory
  #   redirect_to rooms_path, notice: "宿泊施設が削除されました。"
  # end

  # private

  # def set_room
  #   @room = Room.find(params[:id])
  # end

  # def room_params
  #   params.require(:room).permit(:name, :description, :price, :image_url)
  # end
end
