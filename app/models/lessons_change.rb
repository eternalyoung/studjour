class LessonsChange < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher
  belongs_to :group
  validates :group, uniqueness: {scope: [:number, :date]}

  before_validation :set_default_date, on: :create

  private

  def set_default_date
    self.date ||= Date.tomorrow
  end
end
