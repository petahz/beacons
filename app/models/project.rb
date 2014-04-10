class Project < ActiveRecord::Base
  belongs_to :user

  validates :name, :supertype, presence: true
end
