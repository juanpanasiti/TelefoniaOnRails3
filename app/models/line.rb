class Line < ApplicationRecord
  #t.string "number"
  #t.bigint "user_id"
  #t.string "status"
  #t.bigint "account_id", null: false
  #t.date "lastCheck"
  #t.bigint "plan_id"
  #t.string "sim"
  #t.text "details"
  ############ RELATIONS
  belongs_to :user
  belongs_to :account
  belongs_to :plan
  has_many :mail_accounts
  has_one :device

  ############ VALIDATIONS
  validates :number, presence:true
  validates :number, uniqueness:true
  ############ CALLBACKS

  ############ METHODS
  def get_number
    return self.number
  end#get_number

  def get_user_fullname
    user_name = "Sin asignar"
    unless self.user_id.nil?
      user_name = self.user.get_fullname
    end
    return user_name
  end#get_user_fullname

  def get_office_fullname
    office_name = ""
    unless self.user_id.nil?
      office_name = self.user.get_office_fullname
    end
    return office_name
  end#get_office_fullname

  def get_plan
    plan_name = "???"
    unless self.plan_id.nil?
      plan_name = self.plan.get_fullname
    end
    return plan_name
  end#get_plan
  
  ############ CLASS METHODS
  def self.get_user_options
    options = []
    User.all.each do |user|
      options << [user.get_fullname,user.id]
    end
    return options
  end#get_user_options

  def self.get_status_options
    return FormOption.get_options_for("line_status")
  end#get_status_options

  def self.get_account_options
    options = []
    Account.all.each do |account|
      options << [account.name,account.id]
    end
    return options
  end#get_account_options

  def self.get_plan_options
    options = []
    Plan.all.each do |plan|
      options << [plan.name,plan.id]
    end
    return options
  end#get_plan_options

  def self.get_sim_options
    return FormOption.get_options_for("line_sim")
  end#get_sim_options


  def self.get_line_options
    options = []
    self.all.each do |line|
      options << [line.number,line.id]
    end
    return options
  end

  #############CALLBACKS METHODS

end
