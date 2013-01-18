class SetDefaultForEmployeesAdmin < ActiveRecord::Migration
  def up
    change_column :employees, :system_admin, :boolean, :default => FALSE
  end

  def down
  	# You can't currently remove default values in Rails
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
