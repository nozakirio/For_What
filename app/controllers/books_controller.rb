class BooksController < ApplicationController
  def search
    @keyword = params[:keyword]
    @model = params[:model]
    @books = []

    if params[:keyword] && @model == "title"
      @results = RakutenWebService::Books::Book.search(title: @keyword)
    else params[:keyword] && @model == "author"
      @results = RakutenWebService::Books::Book.search(author: @keyword)
    end

    # @results.each do |result|
    #   book = Book.new(read(result))
    #   @books << book
    # end

  end

  def create
  end

  def show
  end

private

  # def read(result)
  #   title = result['title']
  #   author = result['author']
  #   isbn = result['isbn']
  #   publication_date = result['sales_date']
  #   book_image_id = result['mediumImageUrl'].gsub('?_ex=120x120', '')
  #   {
  #     title: title,
  #     author: author,
  #     isbn: isbn,
  #     publication_date: publication_date,
  #     book_image_id: book_image_id
  #   }
  # end

end
