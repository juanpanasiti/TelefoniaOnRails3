class IpPhone < ApplicationRecord
  #t.string "name"
  #t.string "number"
  #t.string "ipAddress"
  ########### RELATIONS
  ########### VALIDATIONS
  validates :name, presence: true
  validates :number, presence: true
  #validates :ipAddress, format: { with: Resolv::IPv4::Regex }

  ########### METHODS
  def get_name
    return self.name
  end#get_name

  def get_number
    return self.number
  end#get_number

  def get_ip
    return self.ipAddress
  end#get_ip
  ########### CLASS METHODA
  ###########
end
