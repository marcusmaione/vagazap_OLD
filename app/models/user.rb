class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :degrees, :dependent => :destroy
  has_many :courses, :dependent => :destroy
  has_many :experiences, :dependent => :destroy
  has_many :companies, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  mount_uploader :avatar, AvatarUploader

  def city
    address.split(', ')[1] + ', ' + address.split(', ')[2] + ', ' + address.split(', ')[3]
  end

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_address?
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice('provider', 'uid')
    user_params.merge! auth.info.slice('email', 'first_name', 'last_name')
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0, 20] # Fake password for validation
      user.save
    end

    user
  end
end
