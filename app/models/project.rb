class Project < ActiveRecord::Base
  attr_accessible :code, :description, :employee_id, :name

  belongs_to :employee
  has_many :items
end
