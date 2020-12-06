class UsersController < ApplicationController
  
  def show
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
