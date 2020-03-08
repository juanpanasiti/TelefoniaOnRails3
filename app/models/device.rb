class Device < ApplicationRecord
  #t.string "imei"
  #t.bigint "device_model_id", null: false
  #t.bigint "line_id", null: false
  #t.string "status"
  #t.boolean "isExternal"
  #t.text "details"
  ####### Relation
  belongs_to :device_model
  belongs_to :line

  ####### Validations
  validates :imei, presence: true
  validates :imei, uniqueness: true
  validates :imei, format: { with: /\A[0-9]{15}+\z/, message: "must be only 15 numeric characters" }
  #validates :imei, length: { is: 15 }
  validates :device_model_id, presence: true
  #validates :line_id, presence: true
  validates :status, presence: true
  validates :isExternal, inclusion: { in: [true, false] }
  validates :isExternal, exclusion: { in: [nil] }
  #"details" no tiene validaciones aún
  #validate :expiration_date_cannot_be_in_the_past,
  #  :discount_cannot_be_greater_than_total_value

  #  def expiration_date_cannot_be_in_the_past
  #    if expiration_date.present? && expiration_date < Date.today
  #      errors.add(:expiration_date, "can't be in the past")
  #    end
  #  end
  #
  #  def discount_cannot_be_greater_than_total_value
  #    if discount > total_value
  #      errors.add(:discount, "can't be greater than total value")
  #    end
  #  end
  ####### METHODS
  def get_full_model_name
    return self.device_model.get_full_model_name
  end#get_full_model_name

  def get_imei
    return self.imei
  end#get_imei

  def get_line_number
    return self.line.get_number
  end#get_line_number

  def get_status
    return self.status
  end#get_status
  ####### CLASS METHODS
  def self.get_status_options
    return FormOption.get_options_for("device_status")
  end#get_status_options

end
