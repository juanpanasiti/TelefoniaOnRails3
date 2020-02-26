class Account < ApplicationRecord
  #t.string "name"
  #t.string "number"
  ############ RELATIONS
  has_many :lines
  ############ VALIDATIONS
  validates :name, presence: true
  validates :number, presence: true
  validates :number, uniqueness: true
  validates :number, format: { with: /\A[0-9]+\z/, message: "Sólo se permiten caracteres numéricos" }
  ############ METHODS
  def get_name
    return self.name
  end#get_name

  def get_number
    return self.number
  end#get_number
  ############ CLASS METHODS
  
end
