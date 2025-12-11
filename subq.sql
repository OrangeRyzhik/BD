# Основы подзапросов
# Простой подзапрос
SELECT 
    *
FROM
    gamers_games
WHERE
    idgamers = (SELECT 
            idgamers
        FROM
            gamers
        WHERE
            name = 'Agaeva');
# Подзапрос с нескольскими результатами (нерабочий)
SELECT 
    *
FROM
    gamers_games
WHERE
    idgamers = (SELECT 
            idgamers
        FROM
            gamers
        WHERE
             country = 'Белоруссия');
# Модернизированный запрос с несколькими результатами в подзапросе (в условии IN)
SELECT 
    *
FROM
    gamers_games
WHERE
    idgamers IN (SELECT 
            idgamers
        FROM
            gamers
        WHERE
            country = 'США');
            
# Использование агрегатных функций для гарантированного единственного значения в результате подзапроса
SELECT 
    *
FROM
    gamers
WHERE
    `level` > (SELECT 
            AVG(`level`)
        FROM
            gamers);

#UNIX_TIMESTAMP(`DATE`)
SELECT 
    *
FROM
    gamers_games
WHERE
    `time` > (SELECT 
            AVG(`time`)
        FROM
            gamers_games)
ORDER BY `time`;
#Выражения в подзапросе
SELECT 
    *
FROM
    gamers
WHERE
    `level` > (SELECT 
            AVG(`level`) + 10
        FROM
            gamers);
# Использование группировки с HAVING при анализе результатов подзапроса
SELECT 
    `level`, COUNT(idgamers)
FROM
    gamers
GROUP BY `level`
HAVING `level` > (SELECT 
        AVG(`level`)
    FROM
        gamers
    WHERE
        country = 'США');

# Связанные (коррелированные) подзапросы
# Сканирование внешней таблицы (проверка для каждой строки) на проверку выполнения условия равенства значения в подзапросе дате 2012-10-16
SELECT 
    *
FROM
    gamers `outer`
WHERE
    '2012-10-16' IN (SELECT 
            `date`
        FROM
            gamers_games `inner`
        WHERE
            `outer`.idgamers = `inner`.idgamers);
# Использование значений, полученных в качестве подсчёта строк в подзапросе, соотвествующих каждой строчке внешней таблицы
SELECT 
    *
FROM
    gamers `outer`
WHERE
    2 < (SELECT 
            COUNT(*)
        FROM
            gamers_games `inner`
        WHERE
            `outer`.idgamers = `inner`.idgamers);
# Поиск тех игр, которые не относятся к любимым ни у одного геймера
SELECT 
    *
FROM
    games `outer`
WHERE
    NOT idgame IN (SELECT 
            favourite_game
        FROM
            gamers `inner`
        WHERE
            `outer`.idgame = `inner`.favourite_game);
# Связь таблицы с собой
# Подсчитываем среднее значение времени для каждого пользователя и выводим значения time, превышающие среднее
SELECT 
    *
FROM
    gamers_games `outer`
WHERE
    `time` > (SELECT 
            AVG(`time`) * 1.2
        FROM
            gamers_games `inner`
        WHERE
            `outer`.idgamers = `inner`.idgamers);
#Функция возведения в степень в MySQL
SELECT POW(2, 128);
SELECT 'QQQ';
# Группировка во внешнем связанном запросе
# Ищем все даты, для которых сумма времени больше как минимум на 20%, чем максимальное время на эту дату
SELECT 
    `date`, TIME((SUM(`time`)))
FROM
    gamers_games `outer`
GROUP BY `date`
HAVING SUM(`time`) > (SELECT 
        MAX(`time`) * 1.2
    FROM
        gamers_games `inner`
    WHERE
        `outer`.`date` = `inner`.`date`);
        
# Оператор EXISTS - выводит результат, если подзапрос выдаёт какое-либо значение
SELECT 
    `name`, `dob`
FROM
    gamers
WHERE
    EXISTS( SELECT 
            *
        FROM
            gamers
        WHERE
            country = 'Непал');
# Использование оператора EXISTS со связанными подзапросами
# Поиск игроков, у которых любимая игра совпадает с любимыми играми других игроков
SELECT 
    *
FROM
    gamers `outer`
WHERE
    EXISTS( SELECT 
            *
        FROM
            gamers `inner`
        WHERE
            `outer`.favourite_game = `inner`.favourite_game
                AND `inner`.idgamers <> `outer`.`idgamers`);
# Соединение таблиц в связанных подзапросах
SELECT 
    `name`, `outer`.country, game_name
FROM
    gamers `outer`,
    games
WHERE
    EXISTS( SELECT 
            *
        FROM
            gamers `inner`
        WHERE
            `outer`.favourite_game = `inner`.favourite_game
                AND `inner`.idgamers <> `outer`.`idgamers`
                AND `outer`.favourite_game = games.idgame);
# Использование NOT EXISTS
SELECT 
    *
FROM
    gamers `outer`
WHERE
    NOT EXISTS( SELECT 
            *
        FROM
            gamers `inner`
        WHERE
            `outer`.favourite_game = `inner`.favourite_game
                AND `inner`.idgamers <> `outer`.`idgamers`);

# Подзапрос второго уровня вложенности
SELECT 
    *
FROM
    games `outer1`
WHERE
    EXISTS( SELECT 
            *
        FROM
            gamers `outer2`
        WHERE
            `outer1`.idgame = `outer2`.favourite_game
                AND 1 < (SELECT 
                    COUNT(*)
                FROM
                    gamers_games `inner`
                WHERE
                    `inner`.idgamers = `outer2`.idgamers));

#