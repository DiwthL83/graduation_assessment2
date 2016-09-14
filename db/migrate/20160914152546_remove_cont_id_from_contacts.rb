class RemoveContIdFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :cont_id, :integer
  end
end
