class Internal < ApplicationRecord
  #t.string "name"
  #t.string "number"
  #t.string "office_id"
  #t.string "kind"
  #t.string "telephone_switch_id"
  #t.boolean "publishable"
  ########### RELATIONS
  belongs_to :telephone_switch
  belongs_to :office
  ########### VALIDATIONS
  validates :name, presence: true
  validates :number, presence: true

  ########### METHODS
  def get_name
    return self.name
  end#get_name

  def get_number
    return self.number
  end#get_number

  def get_office
    return self.office.get_fullname
  end#get_office

  def get_kind
    return self.kind
  end#get_kind

  def get_telephone_switch
    return self.telephone_switch.get_name
  end#get_telephone_switch

  def publishable?
    return self.publishable
  end

  ########### CLASS METHODS
  def self.get_kind_options
    return FormOption.get_options_for("internal_kind")
  end#get_kind_options

  def self.get_telephone_switch_options
    return TelephoneSwitch.get_telephone_switch_options
  end#get_telephone_switch_options

  def self.get_office_options
    return Office.get_office_options
  end#get_office_options
  ###########
end
