class AddIsAdminColumnToReceptionist < ActiveRecord::Migration[5.1]
  def change
    add_column :receptionists, :is_admin, :boolean
  end
end
