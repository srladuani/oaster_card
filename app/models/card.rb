class Card < ApplicationRecord
  belongs_to :user
  validates_presence_of :balance,numerically: true
end
