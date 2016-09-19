class Contact < ActiveRecord::Base
	has_many :contact_logs, dependent: :destroy

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
    elsif Time.now.day > self.contact_logs.max.created_at.day
      "Yesterday"
    else
      "Today"
    end
  end
end
