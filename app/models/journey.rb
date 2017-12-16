class Journey < ApplicationRecord
  belongs_to :user
  enum via: ["tube","bus"]
  before_create :calculate_basic_fare


  def complete!
    return true if self.bus?
    # calculate the final fare and refund the remaining paid fare
    final_fare = final_tube_fare
    user.card.refund(fare_difference(final_fare))
    update(fare: final_fare)
  end

  
  private
    def calculate_basic_fare
      fare = Fare.new(self).calculate_base_fare
      card = user.card
      if card.balance >= fare
        card.charge(fare)
        self.fare = fare
      else
        errors.add(:origin,"Please recharge your card!")
        throw :abort
      end
    end

    def fare_difference final_fare
      (self.fare - final_fare).round(2)
    end


    def final_tube_fare
      fare = Fare.new(self)
      fare.calculate_final_fare(self)
    end
end
