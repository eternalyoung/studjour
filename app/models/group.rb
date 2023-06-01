class Group < ApplicationRecord
  after_create :create_schedule
  has_many :schedules
  has_many :users

  private

  def create_schedule
    (1..6).each do |week|
      Schedule.create(group: self, weeks_day: week)
    end
  end
end
