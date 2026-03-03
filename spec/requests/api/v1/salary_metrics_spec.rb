require "rails_helper"

RSpec.describe "Salary Metrics API", type: :request do
  # SALARY METRICS BY COUNTRY (GET /api/v1/salary_metrics/country)
  describe "GET /api/v1/salary_metrics/country" do
    context "when employees exist for the country" do
      before do
        create(:employee, country: "India", salary: 100000)
        create(:employee, country: "India", salary: 200000)
      end

      it "returns min, max and average salary for the country" do
        get "/api/v1/salary_metrics/country", params: { country: "India" }

        expect(response).to have_http_status(:ok)

        body = JSON.parse(response.body)

        expect(body["minimum_salary"]).to eq(100000)
        expect(body["maximum_salary"]).to eq(200000)
        expect(body["average_salary"]).to eq(150000)
      end
    end

    context "when employees exist for multiple countries" do
      before do
        create(:employee, country: "India", salary: 100000)
        create(:employee, country: "India", salary: 200000)
        create(:employee, country: "United States", salary: 500000)
      end

      it "only calculates metrics for the requested country" do
        get "/api/v1/salary_metrics/country", params: { country: "India" }

        expect(response).to have_http_status(:ok)

        body = JSON.parse(response.body)

        expect(body["minimum_salary"]).to eq(100000)
        expect(body["maximum_salary"]).to eq(200000)
        expect(body["average_salary"]).to eq(150000)
      end
    end

    context "when no employees exist for the country" do
      it "returns nil salary metrics" do
        get "/api/v1/salary_metrics/country", params: { country: "Canada" }

        expect(response).to have_http_status(:ok)

        body = JSON.parse(response.body)

        expect(body["minimum_salary"]).to be_nil
        expect(body["maximum_salary"]).to be_nil
        expect(body["average_salary"]).to be_nil
      end
    end

    context "when country param is missing" do
      it "returns bad request" do
        get "/api/v1/salary_metrics/country"

        expect(response).to have_http_status(:bad_request)

        body = JSON.parse(response.body)
        expect(body["error"]).to eq("country parameter is required")
      end
    end
  end

  # SALARY METRICS BY JOB TITLE (GET /api/v1/salary_metrics/job_title)
  describe "GET /api/v1/salary_metrics/job_title" do
    context "when employees exist for the job title" do
      before do
        create(:employee, job_title: "Developer", salary: 100000)
        create(:employee, job_title: "Developer", salary: 200000)
      end

      it "returns average salary for job title" do
        get "/api/v1/salary_metrics/job_title", params: { job_title: "Developer" }

        expect(response).to have_http_status(:ok)

        body = JSON.parse(response.body)

        expect(body["average_salary"]).to eq(150000)
      end
    end

    context "when employees exist for multiple job titles" do
      before do
        create(:employee, job_title: "Developer", salary: 100000)
        create(:employee, job_title: "Developer", salary: 200000)
        create(:employee, job_title: "Manager", salary: 500000)
      end

      it "only calculates metrics for the requested job title" do
        get "/api/v1/salary_metrics/job_title", params: { job_title: "Developer" }

        expect(response).to have_http_status(:ok)

        body = JSON.parse(response.body)

        expect(body["average_salary"]).to eq(150000)
      end
    end

    context "when no employees exist for the job title" do
      it "returns nil average salary" do
        get "/api/v1/salary_metrics/job_title", params: { job_title: "Designer" }

        expect(response).to have_http_status(:ok)

        body = JSON.parse(response.body)

        expect(body["average_salary"]).to be_nil
      end
    end

    context "when job_title param is missing" do
      it "returns bad request" do
        get "/api/v1/salary_metrics/job_title"

        expect(response).to have_http_status(:bad_request)

        body = JSON.parse(response.body)
        expect(body["error"]).to eq("job_title parameter is required")
      end
    end
  end
end
