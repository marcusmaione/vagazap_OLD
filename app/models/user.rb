class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :degrees, :dependent => :destroy
  has_many :courses, :dependent => :destroy
  has_many :experiences, :dependent => :destroy
  has_many :companies, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  mount_uploader :avatar, AvatarUploader
end
