class Boat < ApplicationRecord
  has_many :plans
  validates :number,  presence: true,
                      numericality: { only_integer: true },
                      uniqueness: true 
  
  # Used in the form fields when choosing boats                    
  def label
    "#{number} - #{name}"
  end
end
