class CreateTelephoneSwitches < ActiveRecord::Migration[6.0]
  def change
    create_table :telephone_switches do |t|
      t.string :ip
      t.string :name
      t.string :header

      t.timestamps
    end
  end
end
