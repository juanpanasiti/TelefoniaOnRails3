class CreateMailAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :mail_accounts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :email
      t.string :pass
      t.date :date
      t.string :note

      t.timestamps
    end
  end
end
