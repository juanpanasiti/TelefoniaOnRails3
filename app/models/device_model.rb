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
  validates :mark, presence: true
  validates :modelName, presence: true
  validates :modelCode, presence: true
  validates :modelCode, uniqueness: {except: nil}
  ############ METHODS
  def get_mark
    return self.mark
  end#get_mark

  def get_full_model_name
    return "#{self.modelName.titleize} (#{self.modelCode.upcase})"
  end#get_full_model_name

  def get_slot_sim
    return self.slotSIM
  end#get_slot_sim

  def get_band
    return self.band
  end#get_band

  def get_os_max
    return self.osMax
  end#get_os_max

  def get_ram_size
    return self.ramSize
  end#get_ram_size

  def get_rom_size
    return self.romSize
  end#get_rom_size

  def get_cpu_freq_max
    return self.cpuFreqMax
  end#get_cpu_freq_max

  def get_cores
    return self.cores
  end

  def get_full_screen_size
    return self.screenResolution
  end

  def get_cams_mp
    return self.mainCam
  end

  def get_battery
    return self.battery
  end

  def get_usb_type
    return self.usbType
  end

  def get_announce_date
    return self.announced
  end

  ############ CLASS METHODS
  def self.get_device_model_options
    options = []
    self.all.each do |device_model|
      options << [device_model.get_full_model_name,device_model.id]
    end
    return options
  end#get_office_options

  #@slot_sim_options = DeviceModel.get_sim_options
  #@band_options = DeviceModel.get_band_options
  #@os_max_options = DeviceModel.get_os_max_options
  #@usb_type_options = DeviceModel.get_usb_type_options
  def self.get_sim_options
    FormOption.get_options_for("device_model_slotSIM")
  end#get_sim_options

  def self.get_band_options
    FormOption.get_options_for("device_model_band")
  end#get_band_options

  def self.get_os_max_options
    FormOption.get_options_for("device_model_osMax")
  end#get_os_max_options

  def self.get_usb_type_options
    FormOption.get_options_for("device_model_usbType")
  end#get_usb_type_options

end
