class Api::V1::EmployeesController < ApplicationController
  before_action :set_employee, only: [ :show, :update ]

  def create
    employee = Employee.new(employee_params)
    if employee.save
      render json: employee, status: :created
    else
      render json: { errors: employee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    employees = Employee.all
    render json: employees, status: :ok
  end

  def show
    if @employee
      render json: @employee, status: :ok
    else
      render json: { error: "Employee not found" }, status: :not_found
    end
  end

  def update
    if @employee
      if @employee.update(employee_params)
        render json: @employee, status: :ok
      else
        render json: { errors: @employee.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Employee not found" }, status: :not_found
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:full_name, :job_title, :country, :salary)
  end

  def set_employee
    @employee = Employee.find_by(id: params[:id])
  end
end
