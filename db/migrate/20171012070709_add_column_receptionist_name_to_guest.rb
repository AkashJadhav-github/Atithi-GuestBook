class AddColumnReceptionistNameToGuest < ActiveRecord::Migration[5.1]
  def change
    add_reference :guests, :name, foreign_key: true
  end
end
