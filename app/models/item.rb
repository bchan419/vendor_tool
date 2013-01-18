class Item < ActiveRecord::Base
  attr_accessible :description, :fob, :fob_port, :item_no, :model_no, :moq, :packaging, :payment_terms, :project_id, :remarks, :repeat_order_leadtime, :source_from, :suggested_retail, :tooling_complete, :vendor, :vendor_brand, :vendor_email

  belongs_to :project

  validates_presence_of :vendor, :vendor_email

end
