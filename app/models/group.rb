class Group < ApplicationRecord
  after_create :create_schedule

  private

  def create_schedule
    (1..6).each do |week|
      Schedule.create(group: self, weeks_day: week)
    end
  end
end
