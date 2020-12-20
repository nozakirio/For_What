require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'バリデーションのテスト' do
    it "全て入力してあるので保存される" do
      book = FactoryBot.create(:book)
      expect(book).to be_valid
    end
    
    it "titleがない場合、無効"  do
      book = Book.new(title: nil)
      expect(book).to_not be_valid
    end
    
    it "authorがない場合、無効"  do
      book = Book.new(author: nil)
      expect(book).to_not be_valid
    end
    
    it "isbnがない場合、無効"  do
      book = Book.new(isbn: nil)
      expect(book).to_not be_valid
    end
    
  end
end
