class UsersController < ApplicationController
  
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
  end
  
  def update
  end

  def unsubscribe
    @user = User.find(params[:id])
  end
  
  def withdraw
  end
  
end
