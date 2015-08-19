class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  
  def show # 追加
#   @user = User.find(params[:id])
    @microposts = @user.microposts
#    @following = @user.following_users(params[:name])
#    @following = @user.following_users(params[:name])
    @follower = @user.following_users #showの部分でフォロワーの数を表示させたいためで必修ではありません。
    @followed = @user.follower_users  #showの部分でフォロワーの数を表示させたいためで必修ではありません。
  end
  
  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to user_path(current_user) , notice: 'プロフィールを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  #フォローしているユーザー
  def followings
    @user = User.find(params[:id])
    @follower = @user.following_users
    @followed = @user.follower_users
  end

  #フォローされているユーザー
  def followers
    @user = User.find(params[:id])
    @followed = @user.follower_users
    @follower = @user.following_users
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :area, :profile, :email, :password,
                                 :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end