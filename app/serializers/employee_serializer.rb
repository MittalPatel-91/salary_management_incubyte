class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :job_title, :country, :salary
end
