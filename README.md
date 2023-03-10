# Лабораторная работа по проектированию базы данных "Банковские счета"
## Описание предметной области
В базе данных банка хранятся данные о счетах клиентов.

О клиентах известно: уникальный номер договора, фамилия, номер телефона, дата рождения, домашний адрес, дата заключения договора, дата расторжения договора. Каждый клиент может открыть любое количество счетов.

По каждому счету известно: уникальный 12-значный номер, валюта счета, остаток на счете, дата и время установления остатка.

Сохраняется также история счетов в форме: старый остаток, новый остаток, дата и время установления нового остатка, причина изменения. Причинами изменения остатка на счете могут быть пополнение счета, перевод денег со счета на счет, снятие наличности.

Отдельно сохраняется история переводов между счетами одного и того же клиента в форме: сумма перевода в валюте исходного счета, дата и время перевода, номер исходного счета, номер целевого счета, номер исходного счета, номер целевого счета. Внутренний курс банка на каждую дату также сохраняется в базе данных.

При обращении клиента оператор банка находит его в базе данных и далее может выполнить любую операцию по переводу денег со счета на счет, пополнение остатка на счете или списание денежных сумм со счета.

## Задание

По описанию предметной области:

1. Построить инфологическую модель предметной области

2. Построить логическую модель базы данных

3. Физически спроектировать базу данных

4. Реализовать простые запросы:
  - Показать, сколько клиентов заключили контракты в каждом месяце первого полугодия 2020 года.
  - Показать все сведения о клиентах, расторгнувших контракты за последние 5 дней.
  - Показать количество счетов у каждого клиента.
  - Найти максимальный по модулю остаток средств на счетах.
  - Показать, сколько раз изменялись остатки на каждом из счетов в марте 2020 года.
  - Показать все сведения о клиентах с номерами в диапазоне от XXXXXXXXXXXX до YYYYYYYYYYYY.
  
5. Реализовать сложные запросы:
- Показать отчет о действиях (пополнение, снятие, перевод) со счетами в 2020 году по форме: номер счета, фамилия владельца счета, количество действий.
- Показать количество переводов с каждого из счетов клиента по фамилии XXXXX.
- Показать все сведения о самом молодом клиенте банка.
- Показать все сведения о счетах, с которых ни разу не переводились деньги на другие счета.
- Показать все сведения о счетах, с которых ни разу не переводились деньги в марте 2020 года.
- Показать все сведения о клиенте, чаще всех совершавшего переводы в 2020 году.

6. Разработать процедуру, которая будет принимать на вход номер перевода. В процедуре реализовать изменение остатков на соответствующих счетах.
7. Разработать триггер, который будет срабатывать при каждом добавлении записи о переводе. В триггере реализовать изменение остатков на соответствующих счетах.

## Использованные инструменты 
Лабораторная работа была полностью выполнена в СУБД MySQL

## Файлы
**report.pdf** - отчет о выполнении работы 

**bank.sql** - дамп базы данных

**simple_query_N.sql** - скрипт простого запроса под номером N

**complex_query_N.sql** - скрипт сложного запроса под номером N

**view.sql** - скрипт представления, требующегося для реализации сложного запроса №6

**procedure.sql** - скрипт процедуры

**trigger.sql** - скрипт триггера
