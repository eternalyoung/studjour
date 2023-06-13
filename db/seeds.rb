# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ROLE = [
  :schedule,
  :change,
  :event
]
LESSONS = [
  "Название урока 1",
  "Название урока 2",
  "Название урока 3",
  "Название урока 4",
  "Название урока 5",
  "Название урока 6",
  "Название урока 7",
  "Название урока 8"
]
TEACHERS = [
  "Имя учителя 1",
  "Имя учителя 2",
  "Имя учителя 3",
  "Имя учителя 4",
  "Имя учителя 5",
  "Имя учителя 6",
  "Имя учителя 7",
  "Имя учителя 8"
]

ROLE.each do |role|
  Role.create!(name: role)
end

5.times do
  Group.find_or_create_by!(name: "#{%W[Б В Г Д М Н П Р С Т К].sample}-#{rand(99)}-#{rand(99)}")
end

6.times do |time|
  10.times do
    LessonsChange.find_or_create_by(
      group: Group.all.sample,
      number: rand(1..8),
      subject: Subject.find_or_create_by(
        name: LESSONS.sample
      ),
      teacher: Teacher.find_or_create_by(
        name: TEACHERS.sample
      ),
      room: rand(101..550),
      date: Date.yesterday + time
    )
  end
end

User.create(email: "admin@admin.seed", password: "admin", status: "verified", roles: Role.all, group: Group.all.sample)
User.create(email: "user@user.seed", password: "user", status: "user", group: Group.all.sample)

Group.all.each do |group|
  6.times do |day|
    first = rand(2)
    num = first
    lessons_count = [*2..4].sample
    while lessons_count > 0
      ActiveRecord::Base.transaction do
        adjacent = false

        if [true, false].sample && num > first
          adjacent = true
          num -= 1
          lessons_count += 1
        end

        group.schedules[day].lessons.create(
          number: num += 1,
          subject: Subject.find_or_create_by(
            name: LESSONS.sample
          ),
          teacher: Teacher.find_or_create_by(
            name: TEACHERS.sample
          ),
          room: rand(101..550),
          adjacent:
        )
        lessons_count -= 1
      end
    end
  end
end
