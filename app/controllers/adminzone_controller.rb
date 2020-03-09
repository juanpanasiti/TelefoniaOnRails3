class AdminzoneController < ApplicationController
  def index
    @admins = Admin.all
    @form_options = FormOption.all.order(:entityName)
    @accounts = Account.all
    @plans = Plan.all
    @offices = Office.all
    @device_models = DeviceModel.all
    @line_statuses = FormOption.get_options_for('line_status')
    @reports = CsvReportLine.all
  end
end
