class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :job_title, :country, :salary

  def salary
    object.salary.to_f
  end
end
