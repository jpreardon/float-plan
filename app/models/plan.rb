class Plan < ApplicationRecord
  belongs_to :boat, optional: true
  validates :boat_id, presence: { message: 'must be selected' }
  belongs_to :skipper, class_name: 'User', foreign_key: 'skipper_id'
  has_and_belongs_to_many :crew, class_name: 'User', join_table: 'crew_plans', association_foreign_key: 'crew_id', foreign_key: 'plan_id'
end
