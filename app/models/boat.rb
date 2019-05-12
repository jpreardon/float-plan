class Boat < ApplicationRecord
  validates :number,  presence: true,
                      numericality: { only_integer: true },
                      uniqueness: true 
end
