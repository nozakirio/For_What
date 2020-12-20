require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    it "name、email、birthday、gender、passwordがあれば有効" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
  
    it "birthdayがない場合、無効"  do
      expect(FactoryBot.build(:user, birthday: "")).to_not be_valid 
    end
    
    it "genderがない場合、無効"  do
      expect(FactoryBot.build(:user, gender: "")).to_not be_valid 
    end
  
    it "重複したemailの場合、無効" do
      user1 = FactoryBot.create(:user,name: "taro", email: "taro@example.com")
      expect(FactoryBot.build(:user, name: "goro", email: user1.email)).to_not be_valid
    end
  
    it "パスワードがない場合、無効" do
      expect(FactoryBot.build(:user, password: "")).to_not be_valid
    end
    
    it "password_confirmationとpasswordが異なる場合、無効" do 
      expect(FactoryBot.build(:user,password:"password",password_confirmation: "passward")).to_not be_valid 
    end
  end
end