class Line < ApplicationRecord
  #t.string "number"
  #t.bigint "user_id", null: false
  #t.string "status"
  #t.bigint "account_id", null: false
  #t.date "lastCheck"
  #t.bigint "plan_id", null: false
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
  ############ CALLBACKS

  ############ METHODS

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
