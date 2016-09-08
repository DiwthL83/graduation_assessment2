class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :cont_id
      t.string :cont_name
      t.string :cont_email
      t.string :cont_tag

      t.timestamps null: false
    end
  end
end
