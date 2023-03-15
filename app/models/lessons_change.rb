class LessonsChange < ApplicationRecord
  belongs_to :lesson
  belongs_to :subject
  belongs_to :teacher
  belongs_to :room
end
