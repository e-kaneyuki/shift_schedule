class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :communities, through: :community_users

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :password_digest, presence: true, length: { minimum: 6 }
  validates :community_id, presence: true, numericality: { only_integer: true }
end
