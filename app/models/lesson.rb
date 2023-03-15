class Lesson < ApplicationRecord
  belongs_to :schedule
  belongs_to :subject
  belongs_to :teacher
  belongs_to :room
end
