class CsvReportLinesController < ApplicationController
  before_action :set_report, only: [:edit, :update, :show]
  before_action :set_form_options, only: [:new, :create, :edit, :update]

  def new
    @report = CsvReportLine.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @report = CsvReportLine.new(report_params)
    @report.set_full_table_from_file(@report.report_file.path)
    respond_to do |format|
      if @report.save!
        flash[:notice] ="Creado exitosamente"
        format.html { redirect_to adminzone_index_path}
        #format.json { render :show, status: :created, location: @form_option }
      else
        flash[:danger] ="Contiene errores"
        format.html { render :new }
        #format.json { render json: @form_option.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    table = @report.get_table
    @table_head = table.first
    @table_body = table[1..-1]
  end

  private
    def set_report
      @report = CsvReportLine.find(params[:id])
    end

    def report_params
      params.require(:csv_report_line).permit(:date, :account_id, :report_file)
    end

    def set_form_options
      @accounts_options = CsvReportLine.get_account_options
    end
end
