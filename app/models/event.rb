class Event < ApplicationRecord
  has_many :subscriptions, dependent: :destroy

  validates :title, presence: true
  validates :title, length: {minimum: 3}
  validates :description, length: {minimum: 30}
  validates :description, length: {maximum: 300}
end
