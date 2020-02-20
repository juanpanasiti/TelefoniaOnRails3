class CreateOffices < ActiveRecord::Migration[6.0]
  def change
    create_table :offices do |t|
      t.belongs_to :office, null: false, foreign_key: true
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
