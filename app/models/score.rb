class Score < ApplicationRecord
  belongs_to :user
  validates :total, numericality: { only_integer: true, greater_than_or_equal: 0, less_than_or_equal: 100 },
                    length: { in: 1..3 }
  default_scope { order('user_id ASC') }
end
