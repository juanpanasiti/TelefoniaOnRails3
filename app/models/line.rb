class Line < ApplicationRecord
  belongs_to :user
  belongs_to :account
  belongs_to :plan

  ########## CLASS METHODS
  def self.get_line_options
    options = []
    self.all.each do |line|
      options << [line.number,line.id]
    end
    return options
  end
end
