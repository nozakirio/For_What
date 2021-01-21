require 'rails_helper'

RSpec.describe AdminBook, type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user)
      @book = FactoryBot.create(:book)
      @post = FactoryBot.create(:post, user_id: @user.id, book_id: @book.id)
    end

    it "全て入力してあるので保存される" do
      admin_book = FactoryBot.create(:admin_book)
      expect(admin_book).to be_valid
    end
  end
end
