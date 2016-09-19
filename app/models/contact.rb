class Contact < ActiveRecord::Base
	has_many :contact_logs, dependent: :destroy
	# accepts_nested_attributes_for :contact_logs
	# validates :cont_name, presence: true, format: {with: / /, message: "Please enter a valid name (no special characters or numbers)."}
	# validates :cont_email, uniqueness: true, format: {with: / /, message: "Please enter a valid email address (ex: abc.123@email.com)."}
	# validates :cont_phone, format: {with: / /, message: "Please enter a valid telephone number (ex: xxx-xxx-xxxx)."}
	# validates :cont_tag, format: {with: / /, message: "Enter a valid tag."}
end
