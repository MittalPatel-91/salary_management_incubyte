class SalaryCalculator
  DEDUCTION_RATES = {
    "India" => 0.10,
    "United States" => 0.12
  }.freeze

  def initialize(employee)
    @employee = employee
  end

  def call
    gross = @employee.salary.to_f
    rate  = DEDUCTION_RATES.fetch(@employee.country, 0.0)

    tds_amount = (gross * rate).round(2)
    net_salary = (gross - tds_amount).round(2)

    {
      gross_salary: gross,
      tds: tds_amount,
      net_salary: net_salary
    }
  end
end
