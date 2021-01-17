class BooksController < ApplicationController
  def search
    @keyword = params[:keyword]
    @model = params[:model]
    # 楽天ブックスの検索結果を@resultsに格納
    if @keyword.present? && @model == "title"
      @results = RakutenWebService::Books::Book.search(title: @keyword)
    elsif @keyword.present? && @model == "author"
      @results = RakutenWebService::Books::Book.search(author: @keyword)
    else
      flash[:notice] = "キーワードを入力してください。"
      redirect_to user_path(current_user)
    end
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    book_entry = Book.find_by(isbn: @book.isbn)
    if book_entry.present?
      redirect_to new_post_path(book: book_entry)
    else
      @book.save
      redirect_to new_post_path(book: @book)
    end
  end

  private

  def book_params
    params.require(:book).permit(
      :title, :author, :isbn, :publication_date, :book_image_id, :book_image_large_id, :item_url
    )
  end
end
