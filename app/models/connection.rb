class Connection < ActiveRecord::Base
	belongs_to :user
	belongs_to :project

	validates_uniqueness_of :user_id, scope: :project_id

	mount_uploader :image, ImageUploader

	scope :active, -> { where(status: "active") }
	scope :completed, -> { where(status: "completed") }

	def active?
		if status == 'active'
			return true
		else
			return false
		end
	end

	def completed?
		if status == 'completed'
			true
		else
			false
		end
	end
end
