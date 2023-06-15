class LessonsChange < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher
  belongs_to :group

  validates :number, presence: true
  validates :number, numericality: {only_integer: true}
  validates :number, numericality: {greater_than: 0}
  validates :number, numericality: {less_than: 8}
  validates :subject, presence: true
  validates :teacher, presence: true
  validates :room, presence: true
  validates :room, numericality: {greater_than: 99}
  validates :room, numericality: {less_than: 1000}
  validates :group, presence: true
  validates :group, uniqueness: {scope: [:number, :date]}

  before_validation :set_default_date, on: :create

  private

  def set_default_date
    self.date ||= Date.tomorrow
  end
end
