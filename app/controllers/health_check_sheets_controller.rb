class HealthCheckSheetsController < ApplicationController
  skip_before_action :check_logined

  def show
    send_file(
      "#{Rails.root}/public/health_check_sheet.pdf",
      filename: 'health_check_sheet.pdf',
      type: 'application/pdf'
    )
  end
end
