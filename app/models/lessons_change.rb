class LessonsChange < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher
  belongs_to :group
end
