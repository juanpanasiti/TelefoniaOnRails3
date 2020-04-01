class TelephoneSwitch < ApplicationRecord
  ############ RELATIONS
  has_many :internals
  ############ VALIDATIONS
  validates :name, presence:true
  validates :name, uniqueness:true
  ############ METHODS
  def get_name
    return self.name
  end#get_name

  def get_header
    return self.header
  end#get_header

  def get_ip
    return self.ip
  end#get_ip

  def count_internals
    count = "X (Ya - Zd)"
    #count = "#{self.internals.count} (#{self.internals.analogue.count}a - #{self.internals.digital.count})"
    return count
  end
  ############ CLASS METHODS
end
