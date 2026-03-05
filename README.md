# Salary Management API

![Ruby](https://img.shields.io/badge/Ruby-3.x-red)
![Rails](https://img.shields.io/badge/Rails-API--Mode-red)
![RSpec](https://img.shields.io/badge/Tested%20with-RSpec-blue)
![License](https://img.shields.io/badge/license-MIT-green)

A **Ruby on Rails API** for managing employees and calculating salary
deductions and salary metrics.

The project demonstrates clean architecture using:

-   Service Objects
-   Query Objects
-   RESTful APIs
-   Test Driven Development (TDD)

------------------------------------------------------------------------

## Features

### 1. Employee CRUD

-   Create an employee
-   List employees
-   Show employee
-   Update employee
-   Delete employee

### 2. Salary Calculation

Calculate tax deductions based on the employee's country.

| Country | Deduction |
|--------|--------|
| India | 10% |
| United States | 12% |
| Others | 0% |

Example response:

``` json
{
  "gross_salary": 100000,
  "tds": 10000,
  "net_salary": 90000
}
```

### 3. Salary Metrics

**By Country**

    GET /api/v1/salary_metrics/country?country=India

Returns: 
- minimum_salary
- maximum_salary
- average_salary

**By Job Title**

    GET /api/v1/salary_metrics/job_title?job_title=Developer

Returns: 
- average_salary

------------------------------------------------------------------------

## Tech Stack

-   Ruby on Rails (8.1)(API Mode)
-   SQLite (database)
-   ActiveModelSerializers
-   RSpec
-   FactoryBot
-   Shoulda Matchers

------------------------------------------------------------------------

## Architecture

The project follows **separation of concerns**:

| Layer       | Responsibility                                |
|-------------|-----------------------------------------------|
| Controllers | Handle HTTP requests and responses            |
| Services    | Business logic (e.g., `SalaryCalculator`)     |
| Queries     | Database aggregations (e.g., `SalaryMetricsQuery`) |
| Serializers | Format JSON responses (`EmployeeSerializer`)  |
| Models      | Represent application data and validations    |

------------------------------------------------------------------------

## API Endpoints

### Employees

| Method | Endpoint | Description |
|------|------|------|
| POST | `/api/v1/employees` | Create employee |
| GET | `/api/v1/employees` | List employees |
| GET | `/api/v1/employees/:id` | Show employee |
| PATCH | `/api/v1/employees/:id` | Update employee |
| DELETE | `/api/v1/employees/:id` | Delete employee |
| GET | `/api/v1/employees/:id/calculate_salary` | Salary breakdown |

---

### Salary Metrics

| Method | Endpoint | Description |
|------|------|------|
| GET | `/api/v1/salary_metrics/country` | Salary metrics by country |
| GET | `/api/v1/salary_metrics/job_title` | Average salary by job title |

------------------------------------------------------------------------

## Project Structure

    app/
     ├── controllers/
     │    ├── api/v1/employees_controller.rb
     │    └── api/v1/salary_metrics_controller.rb
     │
     ├── services/
     │    └── salary_calculator.rb
     │
     ├── queries/
     │    └── salary_metrics_query.rb
     │
     ├── serializers/
     │    └── employee_serializer.rb
     │
     └── models/
          └── employee.rb

------------------------------------------------------------------------

## Setup

Install dependencies:

``` bash
bundle install
```

Setup database:

``` bash
rails db:create db:migrate
```

Seed Data:

You can populate sample employees with:

```bash
rails db:seed
```

Run server:

``` bash
rails s
```

------------------------------------------------------------------------

## Example Request

``` bash
curl -X GET "http://localhost:3000/api/v1/employees/1/calculate_salary"
```

Example response:

``` json
{
  "gross_salary": 100000,
  "tds": 10000,
  "net_salary": 90000
}
```

------------------------------------------------------------------------

## Run Tests

``` bash
bundle exec rspec
```

Test coverage includes:

-   Model validations
-   Request specs
-   Service object tests
-   Edge cases and error handling

------------------------------------------------------------------------

## Implementation Details

AI assistance (ChatGPT) was used during development as a supporting tool for architectural guidance, test strategy discussions, and documentation refinement. 

The core implementation, API design, business logic, and test cases were written and validated manually. AI was primarily used as a reference tool to review best practices in Rails (such as service/query object patterns, RSpec structuring, and README formatting) and to improve clarity and maintainability of the project.

------------------------------------------------------------------------

## Future Improvements

-   Pagination for employee listing
-   Authentication and authorization
-   API documentation (Swagger / OpenAPI)
-   Caching salary metrics

------------------------------------------------------------------------

## Author

Mittal Patel
