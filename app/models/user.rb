class User < ApplicationRecord
  has_one :score, dependent: :destroy
  validates :email, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    admin == true
  end
end
