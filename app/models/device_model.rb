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
    return this.mark
  end#get_mark

  def get_full_model_name
    return "#{this.modelName.titleize} (#{this.modelCode.})"
  end#get_full_model_name

  def get_slot_sim
    return this.slotSIM
  end#get_slot_sim

  def get_band
    return this.get_band
  end#get_band

  def get_os_max
    return this.get_os_max
  end#get_os_max

  def get_ram_size
    return this.ramSize
  end#get_ram_size

  def get_rom_size
    return this.romSize
  end#get_rom_size

  <td><%= dm.get_ram_size %></td>
  <td><%= dm.get_rom_size %></td>
  <td><%= dm.get_cpu_freq_max %></td>
  <td><%= dm.get_cores %></td>
  <td><%= dm.get_full_screen_size %></td>
  <td><%= dm.get_cams_mp %></td>
  <td><%= dm.get_battery %></td>
  <td><%= dm.get_usb_type %></td>
  <td><%= dm.get_announce_date %></td>
  ############ CLASS METHODS
end
