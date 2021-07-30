# == Schema Information
#
# Table name: staff_members
#
#  id                            :bigint           not null, primary key
#  desired_date_of_work          :datetime
#  desired_holiday_date          :datetime
#  group                         :string           not null
#  hope_for_consecutive_holidays :integer          not null
#  name                          :string           not null
#  position                      :string           not null
#  possible_continuous_work      :integer          not null
#  the_number_of_paid_holidays   :float            not null
#  ward                          :string           not null
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
# Indexes
#
#  index_staff_members_on_name  (name) UNIQUE
#
require "rails_helper"

RSpec.describe StaffMember, type: :model do
  # 正常系
  describe "名前のバリデーションテスト" do
    let(:staff_member) { FactoryBot.build(:staff_member) }
    context "名前が入力されている場合" do
      it "登録できる" do
        staff_member = StaffMember.new(name: "kaneyuki", group: "作業療法", ward: "2西", position: "一般")
        expect(staff_member.name).not_to eq nil
      end
    end

    context "名前が入力されていない場合" do
      it "登録できない" do
        staff_member = StaffMember.new(name: "", group: "作業療法", ward: "2西", position: "一般")
        expect(staff_member).to be_invalid
        expect(staff_member.errors[:name]).to include("can't be blank")
      end
    end

    context "名前が20文字以内の場合" do
      it "登録できる" do
        staff_member = StaffMember.new(name: "a" * 20, group: "作業療法", ward: "2西", position: "一般")
        expect(staff_member).to be_valid
        expect(staff_member.name.length).to be <= 20
      end
    end

    context "名前が21文字以上の場合" do
      it "登録できない" do
        staff_member = StaffMember.new(name: "a" * 21, group: "作業療法", ward: "2西", position: "一般")
        expect(staff_member).to be_invalid
        expect(staff_member.errors[:name]).to include("is too long (maximum is 20 characters)")
      end
    end

    context "名前が重複している場合" do
      it "登録できない" do
        StaffMember.create!(name: "kaneyukichan", group: "作業療法", ward: "2西", position: "一般", possible_continuous_work: "4", the_number_of_paid_holidays: "2.5",
                            hope_for_consecutive_holidays: "2")
        staff_member = StaffMember.new(name: "kaneyukichan", group: "理学療法", ward: "4南", position: "リーダー")
        expect(staff_member).to be_invalid
        expect(staff_member.errors[:name]).to include("has already been taken")
      end
    end
  end

  describe "部門(group)のバリデーションテスト" do
    let(:staff_member) { FactoryBot.build(:staff_member) }
    context "groupが入力されている場合" do
      it "登録できる" do
        expect(staff_member.group).not_to eq nil
      end
    end

    context "groupが入力されていない場合" do
      it "登録できない" do
        another_staff_member = StaffMember.new(name: "kaneyukichan", group: "", ward: "2西", position: "一般", possible_continuous_work: 4,
                                               the_number_of_paid_holidays: 2.5, hope_for_consecutive_holidays: 2)
        expect(another_staff_member).to be_invalid
        expect(another_staff_member.errors[:group]).to include("can't be blank")
      end
    end
  end

  describe "病棟(ward)のバリデーションテスト" do
    let(:staff_member) { FactoryBot.build(:staff_member) }
    context "wardが入力されている場合" do
      it "登録できる" do
        expect(staff_member.ward).not_to eq nil
      end
    end

    context "wardが入力されていない場合" do
      it "登録できない" do
        another_staff_member = StaffMember.new(name: "kaneyukichan", group: "作業療法", ward: "", position: "一般", possible_continuous_work: 4,
                                               the_number_of_paid_holidays: 2.5, hope_for_consecutive_holidays: 2)
        expect(another_staff_member).to be_invalid
        expect(another_staff_member.errors[:ward]).to include("can't be blank")
      end
    end
  end

  describe "役職(position)のバリデーションテスト" do
    let(:staff_member) { FactoryBot.build(:staff_member) }
    context "positionが入力されている場合" do
      it "登録できる" do
        expect(staff_member.position).not_to eq nil
      end
    end

    context "positionが入力されていない場合" do
      it "登録できない" do
        another_staff_member = StaffMember.new(name: "kaneyukichan", group: "作業療法", ward: "2西", position: "", possible_continuous_work: 4,
                                               the_number_of_paid_holidays: 2.5, hope_for_consecutive_holidays: 2)
        expect(another_staff_member).to be_invalid
        expect(another_staff_member.errors[:position]).to include("can't be blank")
      end
    end
  end

  # describe "のバリデーションテスト" do
  #   let(:user) { FactoryBot.build(:user) }
  #   context "パスワードが入力されている場合" do
  #     it "登録できる" do
  #       expect(user.password).not_to eq nil
  #     end
  #   end

  #   context "パスワードが入力されていない場合" do
  #     it "登録できない" do
  #       staff_member = StaffMember.new(name: "kinchan", email: "kinchan@example.com", password: "")
  #       expect(user).to be_invalid
  #       expect(user.errors[:password]).to include("can't be blank")
  #     end
  #   end

  #   context "パスワードが5文字以内の場合" do
  #     it "登録できない" do
  #       staff_member = StaffMember.new(name: "kinchan", email: "foo@example.com", password: "a" * 5)
  #       expect(user).to be_invalid
  #       expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  #     end
  #   end

  #   context "パスワードが6文字以上128文字以内の場合" do
  #     it "登録できる" do
  #       staff_member = StaffMember.new(name: "kinchan", email: "foo@example.com", password: "a" * 6)
  #       expect(user).to be_valid
  #       expect(user.password.length).to be >= 6

  #       another_staff_member = StaffMember.new(name: "kinchan", email: "foo@example.com", password: "a" * 128)
  #       expect(another_user).to be_valid
  #       expect(another_user.password.length).to be <= 128
  #     end
  #   end

  #   context "パスワードが129文字以上の場合" do
  #     it "登録できない" do
  #       staff_member = StaffMember.new(name: "kinchan", email: "foo@example.com", password: "a" * 129)
  #       expect(user).to be_invalid
  #       expect(user.errors[:password]).to include("is too long (maximum is 128 characters)")
  #     end
  #   end

  #   context "パスワードが重複している場合" do
  #     it "登録できない" do
  #       User.create!(name: "kinchan", email: "kinchan@example.com", password: "password")
  #       staff_member = StaffMember.new(name: "kinchan", email: "kanechan@example.com", password: "password")
  #       expect(user).to be_invalid
  #       expect(user.errors[:name]).to include("has already been taken")
  #     end
  #   end
  # end
end
