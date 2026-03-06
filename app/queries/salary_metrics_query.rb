class SalaryMetricsQuery
  def initialize(relation = Employee.all)
    @relation = relation
  end

  def by_country(country)
    scoped = @relation.where("LOWER(country) = ?", country.downcase)

    {
      minimum_salary: scoped.minimum(:salary)&.to_f,
      maximum_salary: scoped.maximum(:salary)&.to_f,
      average_salary: scoped.average(:salary)&.to_f
    }
  end

  def by_job_title(job_title)
    scoped = @relation.where("LOWER(job_title) = ?", job_title.downcase)

    {
      average_salary: scoped.average(:salary)&.to_f
    }
  end
end
