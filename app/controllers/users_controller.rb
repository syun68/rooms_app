class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:logout, :profile, :account, :edit, :account_update, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録しました。ようこそ！"
      redirect_to "/users/profile"
    else
      render "/users/new", status: :unprocessable_entity
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user.password == params[:password]
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to "/users/profile"
    else
      flash[:notice] = "メールアドレスまたはパスワードが間違っています"
      render "/users/login_form", status: :unprocessable_entity
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to "/"
  end

  def profile
  end

  def account
  end

  def edit
    @user = User.find(@current_user.id)
  end

  def account_update
    @user = User.find(@current_user.id)
    if @user.current_password == params[:user].permit(:current_password)[:current_password]
      if @user.update(params.require(:user).permit(:email, :password, :password_confirmation, :current_password))
        flash[:notice] = "ユーザー情報を更新しました"
        redirect_to "/users/profile"
      else
        render "users/edit", status: :unprocessable_entity
      end
    else
      binding.pry
      flash[:notice] = "パスワードが間違ってます"
      redirect_to "/users/edit"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to "/users/profile"
    else
      render "users/profile", status: :unprocessable_entity
    end
  end


private

    def user_params
      params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :introduction, :image)
    end

end
