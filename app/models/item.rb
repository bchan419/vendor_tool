class Item < ActiveRecord::Base
  attr_accessible :description, :fob, :fob_port, :item_no, :model_no, :moq, :packaging, :payment_terms, :project_id, :remarks, :repeat_order_leadtime, :source_from, :suggested_retail, :tooling_complete, :vendor, :vendor_brand, :vendor_email
  attr_accessible :photo

  belongs_to :project

  validates_presence_of :vendor, :vendor_email

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment :photo, :presence => true,
                       :content_type => { :content_type => ['image/jpeg', 'image/png'] },
                       :size => { :less_than => 1.megabytes }

# Notes from Paperclip 3.0
#=========================
# Paperclip 3.0 introduces a non-backward compatible change in your attachment
# path. This will help to prevent attachment name clashes when you have
# multiple attachments with the same name. If you didn't alter your
# attachment's path and are using Paperclip's default, you'll have to add
# `:path` and `:url` to your `has_attached_file` definition. For example:

#     has_attached_file :avatar,
#       :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
#       :url => "/system/:attachment/:id/:style/:filename"

end
