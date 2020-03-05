class CsvReportLine < ApplicationRecord
  #t.text "report"
  #t.date "date"
  #t.bigint "account_id", null: false
  attr_accessor :report_file
  ############ RELATIONS
  belongs_to :account
  ############ VALIDATIONS
  validates :account_id, presence: true
  validates :date, presence: true
  validates :report, presence: true
  ############ METHODS
  def get_account
    return self.account.get_name
  end#get_account

  def get_date
    return self.date
  end#get_date

  def get_count_lines
    return self.report.split("\n").count - 1
  end

  def set_full_table_from_file(url_csv)
    self.report = File.read(url_csv, :encoding => 'ISO8859-1')
  end#set_full_table_from_file

  ############ CLASS METHODS

  def self.get_account_options
    options = []
    Account.all.each do |account|
      options << [account.name,account.id]
    end
    return options
  end#get_account_options
end
