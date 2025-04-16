[Исходные файлы в формете .dt в assets к релизу или перейдите по ссылке и в самом низу](https://github.com/antonkuklin006/1C_Enterprise_8/releases/tag/Beta)
   

![kanban](https://github.com/antonkuklin006/1C_Enterprise_8/assets/81790108/25ab5ea9-4d96-4048-b57d-d058e0f46c43)
# Этот репозиторий преднозначен для руководителей проектов IT. 
> Проектный менеджер играющий отдельно от команды - обречен, на провал. Как и его проекты....
©Джон Дорр

## Твои основные дашборды на этапе разработки:
- [Планирование этапов](https://clck.ru/382PaF)
- [Задачи](https://clck.ru/382PsR)
- [Дорожная карта](https://clck.ru/382Qo3)



## Твои основные дашборды на этапе тестирования, на стороне заказчика:
- [Help desk](https://github.com/users/antonkuklin006/projects/2/views/7)
- [Ticket system](https://github.com/users/antonkuklin006/projects/2/views/8)
- [Bug tracker](https://github.com/users/antonkuklin006/projects/2/views/9)

## Что должен понимать:
- [Стэк](https://clck.ru/382KNk)
- [CI\CD](https://clck.ru/382PsR)
- [Клиент-серверная архетектура](https://clck.ru/382Qo3)
- [Бизнес-процессы](https://clck.ru/382Qo3)

## Документация (может изменяться: количеству, содержанию): 
- [Project Charter (Устав проекта)](https://clck.ru/382NPz)
- [Project Management Plan (План управления проектом)](https://clck.ru/382MwW)
- [Work Breakdown Structure (Разработка структуры проекта)](https://clck.ru/382NPz)
- [Risk Register (Реестр рисков)](https://clck.ru/382MwW)
- [Communication Plan (План коммуникаций)](https://clck.ru/382NPz)
- [Resource Management Plan (План управления ресурсами)](https://clck.ru/382MwW)
- [Stakeholder Register (Реестр заинтересованных сторон)](https://clck.ru/382NPz)
- [Change Management Plan (План управления изменениями)](https://clck.ru/382MwW)
- [Cost Management Plan (План управления затратами)](https://clck.ru/382NPz)
- [Scope Management Plan (План управления объемом работ)](https://clck.ru/382MwW)
- [Stakeholder Communication Plan (План коммуникации с заинтересованными сторонами)](https://clck.ru/382NPz)
- [Performance Reports (Отчеты о выполнении)](https://clck.ru/382MwW)
- [Risk Management Plan (План управления рисками)](https://clck.ru/382NPz)
- [Human Resource Management Plan (План управления человеческими ресурсами)](https://clck.ru/382MwW)
- [Project Archive (Архив проекта)](https://clck.ru/382NPz)
- [Project Closeout Report (Отчет о завершении проекта)](https://clck.ru/382MwW)

## Твои основные вопросы: 
- [Важность и приоритеты?](https://clck.ru/382NPz)
- [А что с бизнес-процессом?](https://clck.ru/382MwW)

```mermaid
sequenceDiagram
    participant Alice
    participant Bob
    Alice->>John: Hello John, how are you?
    loop Healthcheck
        John->>John: Fight against hypochondria
    end
    Note right of John: Rational thoughts <br/>prevail!
    John-->>Alice: Great!
    John->>Bob: How about you?
    Bob-->>John: Jolly good!
```
- [Будем делать Ганнта?](https://clck.ru/382MwW)
```mermaid
gantt
    dateFormat  YYYY-MM-DD
    title       Диаграмма Ганта для проекта интеграции 1С: Бит Финанс
    excludes    weekends

    section Спринт 1: Сбор требований и анализ (21.04.2025 - 04.05.2025)
    Интервью                          :s1_t1, 2025-04-21, 20h
    Пользовательские истории          :s1_t2, after s1_t1, 16h
    Анализ инфраструктуры             :s1_t3, after s1_t2, 12h
    Черновик ТЗ                       :s1_t4, after s1_t3, 16h
    Планирование спринта 1            :milestone, 2025-04-21, 0d
    Ревью и ретроспектива спринта 1   :milestone, 2025-05-04, 0d

    section Спринт 2: Разворачивание системы (05.05.2025 - 18.05.2025)
    Установка сервера                 :s2_t1, 2025-05-05, 16h
    Настройка кластера                :s2_t2, after s2_t1, 12h
    Тонкий клиент                     :s2_t3, after s2_t2, 8h
    Тест инфраструктуры               :s2_t4, after s2_t3, 12h
    Журнал                            :s2_t5, after s2_t4, 8h
    Планирование спринта 2            :milestone, 2025-05-05, 0d
    Ревью и ретроспектива спринта 2   :milestone, 2025-05-18, 0d

    section Спринт 3: Настройка интеграции (19.05.2025 - 01.06.2025)
    Контрагенты                       :s3_t1, 2025-05-19, 16h
    Платежи                           :s3_t2, after s3_t1, 20h
    Счета                             :s3_t3, after s3_t2, 12h
    Выписки                           :s3_t4, after s3_t3, 16h
    Тест интеграции                   :s3_t5, after s3_t4, 12h
    Планирование спринта 3            :milestone, 2025-05-19, 0d
    Ревью и ретроспектива спринта 3   :milestone, 2025-06-01, 0d

    section Спринт 4: Настройка отчетов (02.06.2025 - 15.06.2025)
    БДДС                              :s4_t1, 2025-06-02, 20h
    БДР                               :s4_t2, after s4_t1, 16h
    Реестр платежей                   :s4_t3, after s4_t2, 16h
    Дашборд ликвидности               :s4_t4, after s4_t3, 12h
    Тест отчетов                      :s4_t5, after s4_t4, 12h
    Планирование спринта 4            :milestone, 2025-06-02, 0d
    Ревью и ретроспектива спринта 4   :milestone, 2025-06-15, 0d

    section Спринт 5: Автоматизация документов (16.06.2025 - 29.06.2025)
    Платежное поручение               :s5_t1, 2025-06-16, 20h
    Заявка на оплату                  :s5_t2, after s5_t1, 16h
    Акт сверки                        :s5_t3, after s5_t2, 16h
    Платежный календарь               :s5_t4, after s5_t3, 16h
    Тестирование                      :s5_t5, after s5_t4, 12h
    Планирование спринта 5            :milestone, 2025-06-16, 0d
    Ревью и ретроспектива спринта 5   :milestone, 2025-06-29, 0d

    section Спринт 6: Финализация документов и обучение (30.06.2025 - 13.07.2025)
    Кассовый ордер                    :s6_t1, 2025-06-30, 12h
    Справка о расчетах                :s6_t2, after s6_t1, 12h
    Уведомление о платеже             :s6_t3, after s6_t2, 12h
    Проведение тренингов              :s6_t4, after s6_t3, 20h
    Регрессионное тестирование        :s6_t5, after s6_t4, 12h
    Планирование спринта 6            :milestone, 2025-06-30, 0d
    Ревью и ретроспектива спринта 6   :milestone, 2025-07-13, 0d

    section Спринт 7: Пилотный запуск и финализация (14.07.2025 - 27.07.2025)
    Пилотный запуск                   :s7_t1, 2025-07-14, 20h
    Исправление багов                 :s7_t2, after s7_t1, 12h
    Финальное тестирование            :s7_t3, after s7_t2, 12h
    Подписание акта                   :s7_t4, after s7_t3, 8h
    Планирование спринта 7            :milestone, 2025-07-14, 0d
    Ревью и ретроспектива спринта 7   :milestone, 2025-07-27, 0d
```

## Описание/мануал релиза [v1.0.0-beta](https://github.com/antonkuklin006/1C_Enterprise_8/releases/tag/Beta):
![1_page](https://github.com/antonkuklin006/1C_Enterprise_8/assets/81790108/0ba36d67-0c7f-4808-9fa1-b5d6a7f8cac0)
![2_page](https://github.com/antonkuklin006/1C_Enterprise_8/assets/81790108/0299cb5a-6a65-45e5-a169-80305c0d62f8)
- Для полного ознакомления и получения исходников для конфигуратора перейдите по ссылке [клик](https://github.com/antonkuklin006/1C_Enterprise_8/releases/tag/Beta)
