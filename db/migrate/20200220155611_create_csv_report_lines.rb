class CreateCsvReportLines < ActiveRecord::Migration[6.0]
  def change
    create_table :csv_report_lines do |t|
      t.text :report
      t.date :date
      t.belongs_to :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
