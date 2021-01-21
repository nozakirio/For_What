require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'バリデーションのテスト' do
    it "全て入力してあるので保存される" do
      book = FactoryBot.create(:book)
      expect(book).to be_valid
    end
    it "titleがない場合は無効" do
      expect(FactoryBot.build(:book, title: "")).not_to be_valid
    end
    it "authorがない場合は無効" do
      expect(FactoryBot.build(:book, author: "")).not_to be_valid
    end
    it "isbnがない場合は無効" do
      expect(FactoryBot.build(:book, isbn: "")).not_to be_valid
    end
  end
end
