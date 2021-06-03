class Score < ApplicationRecord
  belongs_to :user
  validates :total, numericality: { only_integer: true, in: 0..100 }, length: { in: 1..3 }
  default_scope { order('user_id ASC') }
end