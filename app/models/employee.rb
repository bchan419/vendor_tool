class Employee < ActiveRecord::Base
  attr_accessible :email, :employee_id, :first_name, :last_name, :password, :password_confirmation, :system_admin

  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email


end
