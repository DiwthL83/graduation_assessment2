class ContactLog < ActiveRecord::Base
	belongs_to :contact
	validates :notes, presence: true
						length: {minimum: 7}
end
