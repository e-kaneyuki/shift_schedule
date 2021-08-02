# == Schema Information
#
# Table name: communities
#
#  id               :bigint           not null, primary key
#  communities_name :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_communities_on_communities_name  (communities_name) UNIQUE
#
require "rails_helper"

RSpec.describe Community, type: :model do
  describe "コミュニティー名のバリデーションテスト" do
    context "コミュニティー名が入力されている場合" do
      it "登録できる" do
        community = Community.new(communities_name: "岡山病院" )
        expect(community.communities_name).not_to eq nil
      end
    end
    context "コミュニティー名が入力されていない場合" do
      it "登録できない" do
        another_community = Community.new(communities_name: "" )
        expect(another_community).to be_invalid
        expect(another_community.errors[:communities_name]).to include("can't be blank")
      end
    end
  end
end
