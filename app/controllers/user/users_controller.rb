class User::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: '更新に成功しました。'
    else
      render :edit
    end
  end

  def quit
    @user = current_user
  end


  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "ご利用いただき、ありがとうございました。またのご利用お待ちしております。"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :phone_number)
  end

end
