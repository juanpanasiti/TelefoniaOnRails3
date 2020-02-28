class AdminzoneController < ApplicationController
  def index
    @form_options = FormOption.all
    @accounts = Account.all
    @plans = Plan.all
    @offices = Office.all
    @device_models = DeviceModel.all
    @line_statuses = FormOption.get_options_for('line_status')
  end
end
