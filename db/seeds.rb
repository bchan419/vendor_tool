# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Employee.destroy_all
Project.destroy_all
Item.destroy_all

employees = [
  { first_name: "Flora",
    last_name: "Chan",
    email: "flora@sheentek.com",
    system_admin: TRUE, 
    password: "flora",
    employee_id: 1
  },

  { first_name: "Bernard",
    last_name: "Chan",
    email: "bernard@sheentek.com",
    system_admin: FALSE, 
    password: "bernard",
    employee_id: 2
  }
]

sample_projects = [
  {
    project_owner: "bernard@sheentek.com",
    name: "Mouse",
    code: "BLK-123",
    description: "Mouse project for Belkin"
  },
  {
    project_owner: "flora@sheentek.com",
    name: "LCD-TV",
    code: "AFX-002",
    description: "LCD TV project for AFX"
  }
]

sample_project_items = [
  {
    project: "Mouse",
    item_no: "1",
    source_from: "Wuhan",
    vendor_brand: "COMAT",
    model_no: "M5005",
    description: "Wired Optical Mouse",
    fob: 2.6,
    fob_port: "YANTIAN",
    payment_terms: "Net 30 days",
    moq: 3500,
    repeat_order_leadtime: 60, 
    packaging: "Blister",
    suggested_retail: 19.99,
    tooling_complete: TRUE,
    remarks: "",
    vendor: "Test vendor",
    vendor_email: "test_vendor@email.com"
  },
  {
    project: "Mouse",
    item_no: "2",
    source_from: "Wuhan",
    vendor_brand: "COMAT",
    model_no: "M5188",
    description: "Wired Optical Mouse",
    fob: 2.6,
    fob_port: "YANTIAN",
    payment_terms: "Net 30 days",
    moq: 5000,
    repeat_order_leadtime: 60, 
    packaging: "Blister",
    suggested_retail: 12.95,
    tooling_complete: TRUE,
    remarks: "",
    vendor: "Test vendor",
    vendor_email: "test_vendor@email.com"
  }
]

puts "Creating seed employees"
Employee.create employees

puts "Creating seed projects"
sample_projects.each do |project|
  project_owner = Employee.find_by_email(project[:project_owner])
  Project.create employee_id: project_owner.id, 
                   name: project[:name],
                   code: project[:code],
                   description: project[:description] 
end

puts "Creating seed items"
sample_project_items.each do |item| 
  project = Project.find_by_name(item[:project])
  puts "project name = #{project.name}"
  Item.create project_id: project.id,
              item_no: item[:item_no],
              source_from: item[:source_from],
              vendor_brand: item[:vendor_brand],
              model_no: item[:model_no],
              description: item[:description],
              fob: item[:fob],
              fob_port: item[:fob_port],
              payment_terms: item[:payment_terms],
              moq: item[:moq],
              repeat_order_leadtime: item[:repeat_order_leadtime], 
              packaging: item[:packaging],
              suggested_retail: item[:suggested_retail],
              tooling_complete: item[:tooling_complete],
              remarks: item[:remarks],
              vendor: item[:vendor],
              vendor_email: item[:vendor_email]
end
