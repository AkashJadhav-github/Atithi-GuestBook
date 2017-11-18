class AddReceptionistReferenceToGuest < ActiveRecord::Migration[5.1]
  def change
    add_reference :guests, :receptionist, foreign_key: true
  end
end
