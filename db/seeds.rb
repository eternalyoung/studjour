ROLE = [
  :schedule,
  :change,
  :event
]
LESSONS = [
  "Русский язык",
  "Литература",
  "Иностранный язык",
  "Математика",
  "Информатика",
  "История",
  "Обществознание",
  "География",
  "Физика",
  "Химия с основами экологии",
  "Биология",
  "Физическая культура",
  "Основы безопасности жизнедеятельности",
  "Введение в специальность"
]
TEACHERS = [
  "Носова А. Т.",
  "Карасев М. Т.",
  "Егоров М. И.",
  "Борисова П. Д.",
  "Орлова К. А.",
  "Степанова В. Т.",
  "Сорокин А. И.",
  "Ширяев А. К.",
  "Киселев В. А.",
  "Кузнецова Е. Б."
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
User.create(email: "user@user.seed", password: "user", status: "verified", group: Group.all.sample)

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

TITLES = [
  "Собрание представителей",
  "Собрание студентов",
  "Собрание всех",
  "Концерт",
  "Чаепитие",
  "Защита",
  "World Skills"
]

DESCS = [
  "В актовом зале, будет круто! Всем быть",
  "СТУДЕНТАМ НЕ ПРИХОДИТЬ",
  "Всем быть!!!!",
  "Купите чая",
  "Поддержите свою группу!"
]

20.times do
  Event.create(
    title: TITLES.sample,
    description: DESCS.sample,
    datetime: Date.today + rand(1..10)
  )
end
