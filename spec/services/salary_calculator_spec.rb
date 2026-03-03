require "rails_helper"

RSpec.describe SalaryCalculator do
  let(:employee) { build(:employee, country: country, salary: 100000) }

  subject { described_class.new(employee).call }

  context "when country is India" do
    let(:country) { "India" }

    it "calculates 10% TDS" do
      expect(subject[:gross_salary]).to eq(100000)
      expect(subject[:tds]).to eq(10000)
      expect(subject[:net_salary]).to eq(90000)
    end
  end
end
