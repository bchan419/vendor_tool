class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_no
      t.string :source_from
      t.string :vendor_brand
      t.string :model_no
      t.string :description
      t.decimal :fob
      t.string :fob_port
      t.string :payment_terms
      t.integer :moq
      t.integer :repeat_order_leadtime
      t.string :packaging
      t.decimal :suggested_retail
      t.boolean :tooling_complete
      t.text :remarks
      t.integer :project_id
      t.string :vendor
      t.string :vendor_email

      t.timestamps
    end
  end
end
