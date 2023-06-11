class Lesson < ApplicationRecord
  belongs_to :schedule
  belongs_to :subject
  belongs_to :teacher

  validates :number, presence: true
  validates :number, numericality: {only_integer: true}
  validates :number, numericality: {greater_than: 0}
  validates :number, numericality: {less_than: 8}
  validates :number, uniqueness: {scope: :schedule_id}, unless: -> { adjacent }
  validates :schedule, presence: true
  validates :subject, presence: true
  validates :teacher, presence: true
  validates :room, presence: true
  validates :room, numericality: {greater_than: 99}
  validates :room, numericality: {less_than: 1000}
  validate :adjacent_lesson_uniqueness

  private

  def adjacent_lesson_uniqueness
    return unless adjacent? && schedule.lessons.where(number:, adjacent: true).exists?

    errors.add(:adjacent, "уже есть у урока")
  end
end
