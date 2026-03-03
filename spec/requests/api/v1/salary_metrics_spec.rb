require "rails_helper"

RSpec.describe "Salary Metrics API", type: :request do
  describe "GET /api/v1/salary_metrics/country" do
    let!(:emp1) { create(:employee, country: "India", salary: 100000) }
    let!(:emp2) { create(:employee, country: "India", salary: 200000) }

    it "returns min, max and average salary for the country" do
      get "/api/v1/salary_metrics/country", params: { country: "India" }

      expect(response).to have_http_status(:ok)

      body = JSON.parse(response.body)

      expect(body["minimum_salary"]).to eq(100000)
      expect(body["maximum_salary"]).to eq(200000)
      expect(body["average_salary"]).to eq(150000)
    end
  end

  describe "GET /api/v1/salary_metrics/job_title" do
    let!(:emp1) { create(:employee, job_title: "Developer", salary: 100000) }
    let!(:emp2) { create(:employee, job_title: "Developer", salary: 200000) }

    it "returns average salary for job title" do
      get "/api/v1/salary_metrics/job_title", params: { job_title: "Developer" }

      expect(response).to have_http_status(:ok)

      body = JSON.parse(response.body)

      expect(body["average_salary"]).to eq(150000)
    end
  end
end
