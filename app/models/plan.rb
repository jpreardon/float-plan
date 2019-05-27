class Plan < ApplicationRecord
  belongs_to :boat, optional: true
  validates :boat_id, presence: { message: 'must be selected' }
end
