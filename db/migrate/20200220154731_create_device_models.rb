class CreateDeviceModels < ActiveRecord::Migration[6.0]
  def change
    create_table :device_models do |t|
      t.string :mark
      t.string :modelName
      t.string :modelCode
      t.string :slotSIM
      t.string :band
      t.string :osMax
      t.string :specsLink
      t.integer :ramSize
      t.integer :romSize
      t.float :cpuFreqMax
      t.integer :cores
      t.string :screenResolution
      t.float :screenSize
      t.integer :mainCam
      t.integer :secCam
      t.integer :battery
      t.string :usbType
      t.date :announced

      t.timestamps
    end
  end
end
