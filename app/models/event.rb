class Event < ApplicationRecord
  has_many :subscriptions, dependent: :destroy

  validates :description, length: {maximum: 300}
end
