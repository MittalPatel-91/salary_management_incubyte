class SalaryCalculator
  INDIA_TDS_RATE = 0.10
  US_TDS_RATE = 0.12
  IND = "India"
  US = "United States"

  def initialize(employee)
    @employee = employee
  end

  def call
    gross = @employee.salary
    tds_amount = calculate_tds(gross)

    {
      gross_salary: gross,
      tds: tds_amount,
      net_salary: gross - tds_amount
    }
  end

  private

  def calculate_tds(gross)
    case @employee.country
    when IND
      gross * INDIA_TDS_RATE
    when US
      gross * US_TDS_RATE
    else
      0
    end
  end
end
