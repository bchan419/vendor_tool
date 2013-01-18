class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :system_admin
      t.string :password_digest
      t.integer :employee_id

      t.timestamps
    end
  end
end
