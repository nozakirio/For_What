class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :unsubscribe]

  def show
    @user = User.find(params[:id])
    want_reads_array = []
    have_reads_array = []
    @want_reads = []
    @have_reads = []
    # want_readsに読みたい本、have_readsに読んだ本の情報をそれぞれ格納
    @user.admin_books.order(updated_at: :desc).each do |admin_book|
      if admin_book.want_read == true && admin_book.have_read == false
        want_reads_array << admin_book
        @want_reads = Kaminari.paginate_array(want_reads_array).page(params[:page]).per(5)
      elsif admin_book.want_read == true && admin_book.have_read == true
        have_reads_array << admin_book
        @have_reads = Kaminari.paginate_array(have_reads_array).page(params[:page]).per(5)
      end
    end
  end

  def edit
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
  end

  def withdraw
    @user = current_user
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :birthday, :gender, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
