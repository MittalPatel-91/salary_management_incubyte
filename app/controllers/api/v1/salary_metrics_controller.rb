class Api::V1::SalaryMetricsController < ApplicationController
  def country
    result = SalaryMetricsQuery.new.by_country(params[:country])
    render json: result, status: :ok
  end

  def job_title
    result = SalaryMetricsQuery.new.by_job_title(params[:job_title])
    render json: result, status: :ok
  end
end
