class Card < ApplicationRecord
  belongs_to :user
  validates_presence_of :balance,numerically: true

  def charge fare
    return false if balance < fare
    self.balance -= fare
    save
  end

  def refund amount
    self.balance += amount
    save
  end
end
