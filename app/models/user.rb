class User < ApplicationRecord
  #t.string "name"
  #t.string "lastname"
  #t.string "dni"
  #t.bigint "office_id", null: false
  ############ RELATIONS
  belongs_to :office
  has_many :lines
  ############ VALIDATIONS
  validates :name, presence:true
  validates :lastname, presence:true
  validates :office_id, presence:true
  ############ CALLBACKS

  ############ METHODS
  def get_fullname
    return "#{self.lastname.upcase} #{self.name.titleize}"
  end#get_fullname

  def get_dni_formatted
    return self.dni.reverse.insert(6,'.').insert(3,'.').reverse
  end#get_dni_formatted

  def get_office_fullname
    return self.office.get_fullname
  end

  ############ CLASS METHODS

  #############CALLBACKS METHODS

end
