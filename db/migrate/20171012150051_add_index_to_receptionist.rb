class AddIndexToReceptionist < ActiveRecord::Migration[5.1]
  def change
    #change_table :receptionists do |r|
    #r.index :email_id, unique: true
    add_index :Receptionist, :email_id, unique: true
  end

end


