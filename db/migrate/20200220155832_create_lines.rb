class CreateLines < ActiveRecord::Migration[6.0]
  def change
    create_table :lines do |t|
      t.string :number
      t.belongs_to :user, null: false, foreign_key: true
      t.string :status
      t.belongs_to :account, null: false, foreign_key: true
      t.date :lastCheck
      t.belongs_to :plan, null: false, foreign_key: true
      t.string :sim
      t.text :details

      t.timestamps
    end
  end
end
