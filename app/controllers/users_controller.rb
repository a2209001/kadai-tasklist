class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
     
    if @user.save
      flash[:success] = 'ユーザの登録に成功しました。'
      redirect_to login_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。必要事項を記入の上再登録してください'
      render :new
    end
  end
   private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
