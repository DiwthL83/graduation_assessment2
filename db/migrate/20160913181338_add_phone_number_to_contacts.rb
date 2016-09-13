class AddPhoneNumberToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :cont_phone, :string
    add_column :contacts, :lname, :string
    rename_column :contacts, :name, :fname
  end
end
