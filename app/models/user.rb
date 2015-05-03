class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  mount_uploader :avatar, AvatarUploader
  def member_for
    Date.today.day - created_at.day
  end
  def new_user?
    return true if member_for < 5
  end
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.remote_avatar_url = auth.info.image.gsub('http://','https://')
    end
  end
end
