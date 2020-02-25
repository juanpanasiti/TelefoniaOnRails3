class AdminzoneController < ApplicationController
  def index
    @form_options = FormOption.all
  end
end
