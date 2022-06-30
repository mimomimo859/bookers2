class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id)
       flash[:notice] = "You have updated user successfully."
    else
      @user = User.find(params[:id])
      @users = User.all
      @book = Book.new
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image,:user_id)
  end

end


