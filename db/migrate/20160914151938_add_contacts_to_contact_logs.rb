class AddContactsToContactLogs < ActiveRecord::Migration
  def change
    add_reference :contact_logs, :contact, index: true, foreign_key: true
  end
end
