require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user)
      @book = FactoryBot.create(:book)
    end

    it "新規投稿時、user_id、book_id、reasonが入力してあるので保存される" do
      post = FactoryBot.build(:post)
      expect(post).to be_valid
    end
    it "新規投稿時にreasonがない場合は無効" do
      expect(FactoryBot.build(:post, reason: "")).not_to be_valid
    end
    it "user_idがない場合は無効" do
      expect(FactoryBot.build(:post, user_id: "")).not_to be_valid
    end
    it "book_idがない場合は無効" do
      expect(FactoryBot.build(:post, book_id: "")).not_to be_valid
    end
    it "更新時にstarがない場合は無効" do
      @post = FactoryBot.create(:post)
      expect(@post.update(star: "", comment: "eee")).to eq(false)
    end
    it "更新時にcommentがない場合は無効" do
      @post = FactoryBot.create(:post)
      expect(@post.update(star: "3", comment: "")).to eq(false)
    end
  end
end
