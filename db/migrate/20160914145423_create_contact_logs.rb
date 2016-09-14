class CreateContactLogs < ActiveRecord::Migration
  def change
    create_table :contact_logs do |t|
      t.string :notes

      t.timestamps null: false
    end
  end
end
