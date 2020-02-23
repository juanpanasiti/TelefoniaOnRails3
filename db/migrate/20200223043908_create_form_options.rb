class CreateFormOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :form_options do |t|
      t.string :entityName
      t.string :optionValue

      t.timestamps
    end
  end
end
