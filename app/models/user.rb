class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def member_for
    Date.today.day - created_at.day
  end
  def new_user?
    return true if member_for < 5
  end

end
