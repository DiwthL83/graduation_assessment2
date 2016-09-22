class Contact < ActiveRecord::Base
	has_many :contact_logs, dependent: :destroy

	attr_reader :lastContact

	def lastContact
    if self.contact_logs.length > 0
  		tm_nbr = Time.now-self.contact_logs.max.created_at

      if tm_nbr > 1.year
        helper.pluralize((tm_nbr/1.year).round, "year", plural: "years") + " ago"
      elsif tm_nbr > 1.month
        helper.pluralize((tm_nbr/1.month).round, "month") + " ago"
      elsif tm_nbr > 1.week
        helper.pluralize((tm_nbr/1.week).round, "week") + " ago"
      elsif tm_nbr > 1.day
        helper.pluralize((tm_nbr/1.day).round, "day", plural: "days") + " ago"
      elsif Time.now.day > self.contact_logs.max.created_at.day
        "Yesterday"
      else
        "Today"
      end
    else
      "No contact notes recorded."
    end
  end

end
