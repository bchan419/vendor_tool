class Project < ActiveRecord::Base
  attr_accessible :code, :description, :employee_id, :name

  validates_presence_of :name, :employee_id

  belongs_to :employee
  has_many :items
end
