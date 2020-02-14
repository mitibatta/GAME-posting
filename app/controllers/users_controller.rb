class UsersController < ApplicationController
  PER = 7
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to login_path, success: "登録が正常に完了しました。"
    else
      flash.now[:danger] = "登録に失敗しました。"
      render :new
    end
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.page(params[:page]).per(PER).order(created_at: :desc)
  end
  
  
  
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
