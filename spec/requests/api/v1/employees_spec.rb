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

    it "creates an employee" do
      expect {
        post "/api/v1/employees", params: valid_params
      }.to change(Employee, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end
end
