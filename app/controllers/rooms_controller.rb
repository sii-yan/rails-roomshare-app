class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  # 施設一覧
  def index
    @rooms = current_user.rooms
  end

  # 施設詳細
  def show
  end

  # 施設新規作成フォーム
  def new
    @room = Room.new
  end

   # 施設作成
  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:notice] = "宿泊施設が登録されました。"
      redirect_to @room
    else
      render :new
    end
  end

  # 施設編集フォーム
  def edit
  end

  # 施設更新
  def update
    if @room.update(room_params)
      flash[:notice] = "宿泊施設情報が更新されました。"
      redirect_to @room
    else
      render :edit
    end
  end

  # 施設削除
  def destory
    @room.destory
    flash[:notice] = "宿泊施設が削除されました。"
    redirect_to :rooms_pathnotice
  end

  # 施設検索
  def search
    if params[:area].present?
      @rooms = Room.where("name LIKE ? OR description LIKE ?", "%#{params[:area]}%", "%#{params[:area]}%")
    else
      @rooms = Room.all
    end
    render :index
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def authorize_user!
    redirect_to rooms_path, alert: "権限がありません。" unless @room.user == current_user
  end

  def room_params
    params.require(:room).permit(:name, :description, :price, :address, :image)
  end
end
