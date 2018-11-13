class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 8..30
  
  has_many :rooms
  has_many :comments
  has_many :likes
  mount_uploader :user_pic, AvatarUploader
  serialize :user_pic, JSON
end
