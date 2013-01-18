class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :code
      t.text :description
      t.integer :employee_id

      t.timestamps
    end
  end
end
