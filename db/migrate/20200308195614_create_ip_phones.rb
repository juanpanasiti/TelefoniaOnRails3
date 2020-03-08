class CreateIpPhones < ActiveRecord::Migration[6.0]
  def change
    create_table :ip_phones do |t|
      t.string :name
      t.string :number
      t.string :ipAddress

      t.timestamps
    end
  end
end
