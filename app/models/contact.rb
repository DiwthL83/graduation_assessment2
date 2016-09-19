class Contact < ActiveRecord::Base
	has_many :contact_logs, dependent: :destroy
	# accepts_nested_attributes_for :contact_logs
	# validates :cont_name, presence: true, format: {with: / /, message: "Please enter a valid name (no special characters or numbers)."}
	# validates :cont_email, uniqueness: true, format: {with: / /, message: "Please enter a valid email address (ex: abc.123@email.com)."}
	# validates :cont_phone, format: {with: / /, message: "Please enter a valid telephone number (ex: xxx-xxx-xxxx)."}
	# validates :cont_tag, format: {with: / /, message: "Enter a valid tag."}

	attr_reader :lastContact

	def lastContact
		tm_nbr = Time.now-self.contact_logs.max.created_at

    if tm_nbr > 1.year
      pluralize((tm_nbr/1.year).round, "year") + " ago"
    elsif tm_nbr > 1.month
      pluralize((tm_nbr/1.month).round, "month") + " ago"
    elsif tm_nbr > 1.week
      pluralize((tm_nbr/1.week).round, "week") + " ago"
    elsif tm_nbr > 1.day
      pluralize((tm_nbr/1.day).round, "day") + " ago"
    else
      "Today"
    end
  end
end
