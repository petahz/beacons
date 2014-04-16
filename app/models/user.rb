class User < ActiveRecord::Base
  has_many :connections
  has_many :projects, through: :connections
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :username, :email, uniqueness: { case_sensitive: false }

  scope :heros, -> { where(role: "hero")}

  def admin?
    if role == 'admin'
      return true
    else
      return false
    end
  end

  def owner?
  	if role == 'owner'
  		return true
  	else
  		return false
  	end
  end

  def hero?
  	if role == 'hero'
  		return true
  	else
  		return false
  	end
  end
end
