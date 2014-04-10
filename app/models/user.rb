class User < ActiveRecord::Base
  has_many :projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :password, presence: true

  def owner?
  	if current_user.role == 'owner'
  		return true
  	else
  		return false
  	end
  end

  def hero?
  	if current_user.role == 'hero'
  		return true
  	else
  		return false
  	end
  end
end
