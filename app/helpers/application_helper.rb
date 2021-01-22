module ApplicationHelper
  # isbnからbookの特定
  def book_search(book_isbn)
    Book.find_by(isbn: book_isbn)
  end

  # 読んだ人数をisbnでカウントする
  def read_people(book_isbn)
    AdminBook.where(book_id: book_search(book_isbn), have_read: true).count
  end

  # ページタイトルの設定（指定なしならForWhat?）
  def full_title(page_title)
    base_title = "For What?"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
