class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #######
  def set_level(level)
    this.access_level = level
    this.save
  end

  def get_email
    return self.email.split('@').first
  end
  ####### Permissions
  def can_create?
    if self.access_level >= 3
      return true
    else
      return false
    end
  end#can_create?
end
