class CreateInternals < ActiveRecord::Migration[6.0]
  def change
    create_table :internals do |t|
      t.belongs_to :telephone_switch, null: false, foreign_key: true
      t.string :number
      t.string :name
      t.belongs_to :office, null: false, foreign_key: true
      t.string :kind

      t.timestamps
    end
  end
end
