class AdminzoneController < ApplicationController
  def index
    @form_options = FormOption.all
    @accounts = Account.all
    @line_statuses = FormOption.get_options_for('line_status')
  end
end
