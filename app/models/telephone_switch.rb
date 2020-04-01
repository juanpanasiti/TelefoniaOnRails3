class TelephoneSwitch < ApplicationRecord
  ############ RELATIONS
  has_many :internals
  ############ VALIDATIONS
  validates :name, presence:true
  validates :name, uniqueness:true
  ############ SCOPES

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
    internals = Internal.by_telephone_switch(self.id)
    total_count = internals.count
    partial_counts = []
    count = "#{total_count} ("

    kinds = Internal.get_kind_options
    kinds.each do |kind|
      count += "#{internals.by_kind(kind).count}#{kind[0]}"
      unless kind == kinds.last
        count += " + "
      end
    end
    count += ")"
    return count
  end
  ############ CLASS METHODS
  def self.get_telephone_switch_options
    options = [["",""]]
    self.all.each do |ts|
      options << [ts.get_name,ts.id]
    end
    return options
  end#get_office_options
end
