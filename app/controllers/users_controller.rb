class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)  ##更新成功でチャット画面遷移
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity  ##更新失敗で編集画面遷移
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
