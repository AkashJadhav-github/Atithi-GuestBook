class CreateReceptionists < ActiveRecord::Migration[5.1]
  def change
    create_table :receptionists do |t|
      t.string :name
      t.string :email_id
      t.string :password_digest

      t.timestamps
    end
  end
end
