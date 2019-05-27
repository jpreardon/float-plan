class Plan < ApplicationRecord
  belongs_to :boat, optional: true
  validates :boat_id, presence: { message: 'must be selected' }
  belongs_to :skipper, class_name: 'User', foreign_key: 'skipper_id'
end
