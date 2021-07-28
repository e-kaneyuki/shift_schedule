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
FactoryBot.define do
  factory :community do
  end
end
