require 'rails_helper'

RSpec.describe AdminBook, type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user)
      @book = FactoryBot.create(:book)
      @post = FactoryBot.create(:post, user_id: @user.id, book_id: @book.id)
    end

    it "全て入力してあるので保存される" do
      admin_book = FactoryBot.create(
        :admin_book, user_id: @user.id, book_id: @book.id, post_id: @post.id
      )
      expect(admin_book).to be_valid
    end
    it "have_readがない場合は無効" do
      admin_book = AdminBook.new(have_read: nil)
      expect(admin_book).not_to be_valid
    end
    it "want_readがない場合は無効" do
      admin_book = AdminBook.new(want_read: nil)
      expect(admin_book).not_to be_valid
    end
    it "user_idがない場合は無効" do
      admin_book = AdminBook.new(user_id: nil)
      expect(admin_book).not_to be_valid
    end
    it "book_idがない場合は無効" do
      admin_book = AdminBook.new(book_id: nil)
      expect(admin_book).not_to be_valid
    end
    it "post_idがない場合は無効" do
      admin_book = AdminBook.new(post_id: nil)
      expect(admin_book).not_to be_valid
    end
  end
end
