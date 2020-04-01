class AdminzoneController < ApplicationController
  def index
    @admins = Admin.all
    @form_options = FormOption.all.order(:entityName)
    @accounts = Account.all
    @plans = Plan.all
    @offices = Office.get_ordered_by_organization_chart.collect()
    @device_models = DeviceModel.all
    @line_statuses = FormOption.get_options_for('line_status')
    @reports = CsvReportLine.all
    @telephone_switches = TelephoneSwitch.all
    @internals = Internal.all
  end
end
