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
    context 'が30文字以内の場合' do
      it '登録できる' do
        expect(user.name.length).to be <= 30
      end
    end

    # context 'が重複していない場合' do
    #   it '登録できる' do
    #     # expect(user.name). ここに重複しないことを書きたい
    #   end
    # end

  end
end
# end
#       # email
#       # expect(user.email).to
#       # # password
#       # expect(user.password).those
#      # 異常系
# end
