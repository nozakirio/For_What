class BooksController < ApplicationController
  def search
    @keyword = params[:keyword]
    if params[:keyword]
      @books = RakutenWebService::Books::Book.search(title: @keyword)
    end
  end

  def create
  end

  def show
  end

end
