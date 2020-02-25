class FormOption < ApplicationRecord
  #entityName
  #optionValue
  ########### VALIDATIONS
  validates :entityName, presence: true
  validates :optionValue, presence: true
  #validates :optionValue, uniqueness: true, scope :entityName

  ########### METHODS
  def get_entity_name
    return self.entityName.split('_').first.titleize
  end#get_entity_name

  def get_field_name

    return self.entityName.split('_')[1..-1].join(' ').titleize
  end#get_field_name

  def get_value
    return self.optionValue
  end#get_value
  ########### CLASS METHODS
  def self.get_fields_options
    options = []
    options << ["Estado (Equipo)","device_status"]

    return options
  end#get_fields_options

  def self.get_options_for(entityName)
    options = []
    self.where(entityName: entityName).each do |option|
      options << option.optionValue
    end
    return options
  end#get_options_for
end#CLASS
