class Account < ApplicationRecord
  #t.string "name"
  #t.string "number"
  ############ RELATIONS
  has_many :lines
  ############ VALIDATIONS
  validates :name, presence: true
  validates :number, presence: true
  validates :number, uniqueness: true
  ############
end
