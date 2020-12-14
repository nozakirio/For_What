class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])
    @want_reads = []
    @have_reads = []
    @user.admin_books.each do |admin_book|
      if admin_book.want_read == true && admin_book.have_read == false
        @want_reads << admin_book
      else admin_book.want_read == true && admin_book.have_read == true
        @have_reads << admin_book
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def unsubscribe
    @user = User.find(params[:id])
  end
  
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :birthday, :gender, :profile_image)
  end
  
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
  
end
