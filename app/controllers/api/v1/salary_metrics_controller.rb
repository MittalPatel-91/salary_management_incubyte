class Api::V1::SalaryMetricsController < ApplicationController
  def country
    return render_missing_param("country") unless params[:country].present?

    result = SalaryMetricsQuery.new.by_country(params[:country])
    render json: result, status: :ok
  end

  def job_title
    return render_missing_param("job_title") unless params[:job_title].present?

    result = SalaryMetricsQuery.new.by_job_title(params[:job_title])
    render json: result, status: :ok
  end

  private

  def render_missing_param(param_name)
    render json: { error: "#{param_name} parameter is required" },
           status: :bad_request
  end
end
