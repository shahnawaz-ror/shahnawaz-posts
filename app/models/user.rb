class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:google_oauth2]
  validates :first_name, presence: true
  validates :last_name, presence: true

  mount_uploader :avatar, AvatarUploader
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  def self.create_from_provider_data(auth)
    where("(provider = ? AND uid = ?) OR (email = ?)", auth[:provider], auth[:uid], auth.info.email).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.avatar = auth.info.image 
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.first_name 
      user.last_name = auth.info.last_name   
    end
  end
end
