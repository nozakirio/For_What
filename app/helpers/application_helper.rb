module ApplicationHelper
  # isbnからbookの特定
  def book_search(book_isbn)
    Book.find_by(isbn: book_isbn)
  end

  # 読んだ人数をisbnでカウント　
  def read_people(book_isbn)
    AdminBook.where(book_id: book_search(book_isbn), have_read: true).count
  end
end

