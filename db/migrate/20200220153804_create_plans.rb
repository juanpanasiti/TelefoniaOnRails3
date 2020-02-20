class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.string :codeName
      t.string :details

      t.timestamps
    end
  end
end
