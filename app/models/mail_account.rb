class MailAccount < ApplicationRecord
  #t.bigint "user_id", null: false
  #t.string "email"
  #t.string "pass"
  #t.date "date"
  #t.string "note"
  ############ RELATIONS
  belongs_to :user

  ############ VALIDATIONS
  validates :user_id, presence:true
  validates :email, presence:true
  validates :date, presence:true
  ############ CALLBACKS

  ############ METHODS

  ############ CLASS METHODS

  #############CALLBACKS METHODS
end
