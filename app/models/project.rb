class Project < ActiveRecord::Base
  has_many :connections
  has_many :users, through: :connections

  validates :name, :supertype, presence: true
end
