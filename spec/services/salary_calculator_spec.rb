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

  context "when country is United States" do
    let(:country) { "United States" }

    it "calculates 12% TDS" do
      expect(subject[:gross_salary]).to eq(100000)
      expect(subject[:tds]).to eq(12000)
      expect(subject[:net_salary]).to eq(88000)
    end
  end

  context "when country is other" do
    let(:country) { "Netherlands" }

    it "calculates 0% TDS" do
      expect(subject[:gross_salary]).to eq(100000)
      expect(subject[:tds]).to eq(0)
      expect(subject[:net_salary]).to eq(100000)
    end
  end
end
