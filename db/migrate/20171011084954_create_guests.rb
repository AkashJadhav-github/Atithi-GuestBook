class CreateGuests < ActiveRecord::Migration[5.1]
	
  def change
    create_table :guests do |t|
      t.string :name
      t.string :email_id
      t.string :mobile_no
      t.datetime :in_time
      t.datetime :out_time

      t.timestamps
    end
  end
end
