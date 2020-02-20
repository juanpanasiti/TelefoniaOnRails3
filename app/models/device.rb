class Device < ApplicationRecord
  belongs_to :deviceModel
  belongs_to :line
end
