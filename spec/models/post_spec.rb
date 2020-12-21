require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user)
      @book = FactoryBot.create(:book)
    end

    it "全て入力してあるので保存される" do
      post = FactoryBot.create(:post, user_id: @user.id, book_id: @book.id)
      expect(post).to be_valid
    end
    it "reasonがない場合は無効" do
      post = Post.new(reason: nil)
      expect(post).not_to be_valid
    end
    it "user_idがない場合は無効" do
      post = Post.new(user_id: nil)
      expect(post).not_to be_valid
    end
    it "book_idがない場合は無効" do
      post = Post.new(book_id: nil)
      expect(post).not_to be_valid
    end
  end
end
