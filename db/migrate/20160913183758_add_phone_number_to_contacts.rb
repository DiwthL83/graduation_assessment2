class AddPhoneNumberToContacts < ActiveRecord::Migration
  def change
  	add_column :contacts, :cont_fname, :string
  	add_column :contacts, :cont_phone, :string
  	rename_column :contacts, :cont_name, :cont_lname
  end
end
