class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader # Tells rails to use this uploader for this model.
  validates :name,:avatar, presence: true
  has_many :events, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :likes, dependent: :destroy
end
