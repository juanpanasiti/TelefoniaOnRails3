class Office < ApplicationRecord
  #t.bigint "office_id", null: false
  #t.string "name"
  #t.string "category"
  ############ RELATIONS
  belongs_to :office, optional: true
  has_many :offices
  ############ VALIDATIONS
  validates :name, presence:true
  validates :category, presence:true
  ############ CALLBACKS

  ############ METHODS
  def get_fullname
    return "#{self.category.titleize} #{self.name.titleize}"
  end

  def get_father
    unless self.office_id.nil?
      return self.office
    else
      return 0
    end
  end#get_father

  def get_father_fullname()
    if self.get_father != 0
      return self.get_father.get_fullname
    else
      return ""
    end
  end#get_father_fullname
  ############ CLASS METHODS
  def self.get_category_options
    return FormOption.get_options_for("office_category")
  end#get_category_options

  def self.get_office_options
    options = []
    self.all.each do |office|
      options << [office.get_fullname,office.id]
    end
  end#get_office_options

  #############CALLBACKS METHODS

end
