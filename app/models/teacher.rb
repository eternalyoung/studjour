class Teacher < ApplicationRecord
  has_many :lessons
  validates :name, presence: true
  validates :name, uniqueness: true
end
