class Schedule < ApplicationRecord
  DAYS_OF_WEEK = {
    1 => "Понедельник",
    2 => "Вторник",
    3 => "Среда",
    4 => "Четверг",
    5 => "Пятница",
    6 => "Суббота"
  }.freeze

  belongs_to :group
  has_many :lessons

  def wday
    DAYS_OF_WEEK[weeks_day]
  end
end
