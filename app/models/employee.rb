# == Employee Schema Information
# Table name: employees
#  id         :bigint           not null, primary key
#  full_name  :string           not null
#  job_title  :string           not null
#  country    :string           not null
#  salary     :decimal(15, 2)   not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
class Employee < ApplicationRecord
  validates :full_name, presence: true
  validates :job_title, presence: true
  validates :country, presence: true
  validates :salary, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
