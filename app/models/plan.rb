class Plan < ApplicationRecord
  #t.string "name"
  #t.string "codeName"
  #t.string "details"
  ############ RELATIONS
  has_many :lines
  ############ VALIDATIONS
  validates :name, presence:true
  validates :codeName, presence:true
  validates :codeName, uniqueness:true
  validates :details, presence:true
  ############ METHODS
  def get_name
    return self.name
  end#get_name

  def get_code_name
    return self.codeName
  end#get_code_name

  def get_fullname
    return "#{self.name} (#{self.codeName})"
  end#get_fullname
  ############ CLASS METHODS
end
