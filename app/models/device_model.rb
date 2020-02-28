class DeviceModel < ApplicationRecord
  #t.string "mark"
  #t.string "modelName"
  #t.string "modelCode"
  #t.string "slotSIM"
  #t.string "band"
  #t.string "osMax"
  #t.string "specsLink"
  #t.integer "ramSize"
  #t.integer "romSize"
  #t.float "cpuFreqMax"
  #t.integer "cores"
  #t.string "screenResolution"
  #t.float "screenSize"
  #t.integer "mainCam"
  #t.integer "secCam"
  #t.integer "battery"
  #t.string "usbType"
  #t.date "announced"
  ########### RELATIONS
  has_many :devices
  ############ VALIDATIONS
  ############ METHODS
  ############ CLASS METHODS
end
