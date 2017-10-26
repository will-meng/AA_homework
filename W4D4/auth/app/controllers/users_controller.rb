class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
      redirect_to user_url(user.id)
    else
      render json: user.errors.full_messages
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render :show
    else
      render json: 'Cannot find that user'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user
      render :edit
    else
      render json: 'Cannot find that user'
    end
  end

  def update
    user = User.find_by(id: params[:id])

    if user.update(user_params)
      redirect_to user_url(user.id)
    else
      render json: 'Cannot find that user'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
