class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :imei
      t.belongs_to :device_model, null: false, foreign_key: true
      t.belongs_to :line, null: false, foreign_key: true
      t.string :status
      t.boolean :isExternal
      t.text :details

      t.timestamps
    end
  end
end
