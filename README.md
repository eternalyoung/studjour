# Журнал студента

## Задачи

- [ ] Раздел всех расписаний
  - [x] Отображение списка всех групп
  - [x] Создание и изменение групп
  - [x] Генерация шести расписаний под каждый день недели для группы
  - [x] Добавление в расписание нового урока
    - [x] Валидация урока
    - [x] Добавление в урок нового преподавателя
      - [x] Валидация преподавателя
    - [x] Добавление в урок нового предмета
      - [x] Валидация предмета
  - [x] Изменение урока
  - [ ] Авторизация
    - [x] Визуальная
    - [ ] Физическая

- [ ] Раздел актуального расписания
  - [ ] Система двух недель
    - [ ] Реализация
      - [x] Модель и контроллер
      - [ ] Джоба на смену раз в неделю
    - [x] Использование
  - [x] Применение изменений

- [ ] Раздел изменений
  - [x] Отображение списка изменений расписания
    - [x] Список на сегодня/завтра
    - [x] Список на выбранную дату
  - [x] Добавление нового изменения
    - [x] Валидация изменения
  - [ ] Редактирование существующего изменения
  - [ ] Авторизация
    - [x] Визуальная
    - [ ] Физическая

- [ ] Раздел мероприятий
  - [x] Отображение списка мероприятий
  - [x] Добавление нового мероприятия
  - [x] Редактирование существующего мероприятия
  - [ ] Система подписок
  - [ ] Авторизация
    - [x] Визуальная
    - [ ] Физическая

- [ ] Раздел пользователя
  - [ ] Регистрация нового пользователя
    - [x] Создание нового пользователя
    - [ ] Отправка писем для подтверждения аккаунта
  - [x] Вход и выход из системы
  - [x] Управление личным профилем
  - [ ] Система уведомлений
    - [x] Настройки уведомлений
    - [ ] Отправка уведомлений с расписанием
    - [ ] Отправка уведомлений с изменениями
    - [ ] Отправка уведомлений со всеми запланированными мероприятиями

## Установка и Запуск

1. Клонируйте репозиторий на локальную машину.
2. Установите все зависимости, выполнив команду `bundle install`.
3. Создайте и выполните миграции базы данных, используя команду `rails db:migrate`.
4. Запустите локальный сервер с помощью команды `rails server`.
5. Откройте веб-браузер и перейдите по адресу `http://localhost:3000`.
