require "rails_helper"

RSpec.describe "Employees API", type: :request do
  # CREATE (POST /api/v1/employees)
  describe "POST /api/v1/employees" do
    let(:valid_params) do
      {
        employee: {
          full_name: "John Doe",
          job_title: "Developer",
          country: "India",
          salary: 50000
        }
      }
    end
    let(:invalid_params) do
      {
        employee: {
          full_name: nil,
          job_title: "Developer",
          country: "India",
          salary: 50000
        }
      }
    end

    it "creates an employee" do
      expect {
        post "/api/v1/employees", params: valid_params
      }.to change(Employee, :count).by(1)

      expect(response).to have_http_status(:created)
    end

    it "returns errors for invalid params" do
      post "/api/v1/employees", params: invalid_params

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  # INDEX (GET /api/v1/employees)
  describe "GET /api/v1/employees" do
    let!(:employees) { create_list(:employee, 2) }

    it "returns a list of all employees" do
      get "/api/v1/employees"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  # SHOW (GET /api/v1/employees/:id)
  describe "GET /api/v1/employees/:id" do
    let!(:employee) { create(:employee) }

    it "returns the employee" do
      get "/api/v1/employees/#{employee.id}"

      expect(response).to have_http_status(:ok)

      body = JSON.parse(response.body)

      expect(body["id"]).to eq(employee.id)
      expect(body["full_name"]).to eq(employee.full_name)
      expect(body["job_title"]).to eq(employee.job_title)
      expect(body["country"]).to eq(employee.country)
      expect(body["salary"]).to eq(employee.salary)
    end

    it "returns record not found for non-existent employee" do
      get "/api/v1/employees/9999"

      expect(response).to have_http_status(:not_found)
      body = JSON.parse(response.body)
      expect(body["error"]).to eq("Employee not found")
    end
  end
end
