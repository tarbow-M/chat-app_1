class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def index
  end

  def create
    # binding.pry
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    room = Room.find(params[:id])  ## Room.find(params[:id]) = どのルームを消すか特定
    room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
