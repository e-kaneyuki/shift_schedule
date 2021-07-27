require "rails_helper"

RSpec.describe User, type: :model do
  # 正常系
  describe '名前' do
    let(:user) { FactoryBot.build(:user) }
    context 'が入力されている場合' do
      it "登録できる" do
        expect(user.name).not_to eq nil
      end
    end
    context 'が入力されていない場合' do
      it "登録できない" do
        user = User.new(name: "", email: "kinchan@example.com", password: "password")
        # binding.pry
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("can't be blank")
      end
    end
    context 'が30文字以内の場合' do
      it '登録できる' do
        user = User.create!(name: "a" * 30, email: "foo@example.com", password: "password")
        expect(user).to be_valid
        expect(user.name.length).to be <= 30
      end
    end
    context 'が31文字以上の場合' do
      it '登録できない' do
        user = User.new(name: "a" * 31, email: "foo@example.com", password: "password")
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("is too long (maximum is 30 characters)")
      end
    end

    context 'が重複している場合' do
      it '登録できない' do
        User.create!(name: "kinchan", email: "kinchan@example.com", password: "password")
        user = User.new(name: "kinchan", email: "kanechan@example.com", password: "password")
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("has already been taken")
      end
    end
  end

  describe 'メールアドレス' do
    let(:user) { FactoryBot.build(:user) }
    context 'が入力されている場合' do
      it "登録できる" do
        expect(user.email).not_to eq nil
      end
    end
    context 'が入力されていない場合' do
      it "登録できない" do
        user = User.new(name: "kanechan", email: "", password: "password")
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("can't be blank")
      end

    context 'が重複している場合' do
      it '登録できない' do
        User.create!(name: "kinchan", email: "kinchan@example.com", password: "password")
        user = User.new(name: "kanechan", email: "kinchan@example.com", password: "password")
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("has already been taken")
      end
    end
  end

  describe 'パスワード' do
    let(:user) { FactoryBot.build(:user) }
    context 'が入力されている場合' do
      it "登録できる" do
        expect(user.password).not_to eq nil
      end
    end

    context 'が入力されていない場合' do
      it "登録できない" do
        user = User.new(name: "kinchan", email: "kinchan@example.com", password: "")
        expect(user).to be_invalid
        expect(user.errors[:password]).to include("can't be blank")
      end
    end
    context 'が5文字以内の場合' do
      it '登録できない' do
        user = User.new(name: "kinchan", email: "foo@example.com", password: "a"*5)
        expect(user).to be_invalid
        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end
    end
    context 'が6文字以上128文字以内の場合' do
      it '登録できる' do
        user = User.new(name: "kinchan" , email: "foo@example.com", password: "a"*6)
        expect(user).to be_valid
        expect(user.password.length).to be >= 6

        another_user = User.new(name: "kinchan" , email: "foo@example.com", password: "a"*128)
        expect(another_user).to be_valid
        expect(another_user.password.length).to be <= 128
      end
    end
    context 'が129文字以上の場合' do
      it '登録できない' do
        user = User.new(name: "kinchan", email: "foo@example.com", password: "a"*129)
        expect(user).to be_invalid
        expect(user.errors[:password]).to include("is too long (maximum is 128 characters)")
      end
    end

    context 'が重複している場合' do
      it '登録できない' do
        User.create!(name: "kinchan", email: "kinchan@example.com", password: "password")
        user = User.new(name: "kinchan", email: "kanechan@example.com", password: "password")
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("has already been taken")
      end
    end
  end
end
end
