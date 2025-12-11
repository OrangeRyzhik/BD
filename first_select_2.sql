
/* Выборка из нескольких таблиц с соединением */
SELECT `gamers`.`idgamers`,
    `gamers`.`name`,
    `gamers`.`country`,
    `gamers`.`favourite_game`,
    `gamers`.`date_of_birth`
FROM `bd1`.`gamers`;


SELECT 
    gamers.`name`, games.`game_name`, games.`country` as 'Страна разработчика'
FROM
    `bd1`.`gamers`,
    games
WHERE
   favourite_game = `games`.`id_game`;  

/*Исключение дублирующихся значений из результатов запроса*/
SELECT DISTINCT
    `country`
FROM
    games;
/* Исключаются дублирующие значений из результатов совпадающие строки*/
SELECT distinct
    `game`,`gamers`
FROM
    bd1.gamers_games_new;
    
    /* использование фильтрации значений (предложение WHERE)*/
    /*Проверка Страны*/
    SELECT distinct
		gamers.`name`,`country`
	From
	`bd1`.`gamers`
    where
    `country` = 'Китай';
    
     SELECT 
		gamers.`name`,`country`
	From
	`bd1`.`gamers`
    where
    `country` < 'США';
    
    /* сравнение дат с помощью операторов >, <, >=, <= опускаются запись YYYYMMDD без проверки конкретных значений MM и DD */
    SELECT 
    `gamers_games_new`.`idgamers_games_new`,
    `gamers_games_new`.`gamers`,
    `gamers_games_new`.`game`,
    `gamers_games_new`.`date`,
    `gamers_games_new`.`time`
FROM
    `bd1`.`gamers_games_new`
WHERE
	`date` > 2020000;
    SELECT 
    `gamers_games_new`.`idgamers_games_new`,
    `gamers_games_new`.`gamers`,
    `gamers_games_new`.`game`,
    `gamers_games_new`.`date`,
    `gamers_games_new`.`time`
FROM
    `bd1`.`gamers_games_new`
    WHERE
    `time` > '00:10:10';
    
/*Логические операторы при составных условиях*/
SELECT 
    `gamers_games_new`.`idgamers_games_new`,
    `gamers_games_new`.`gamers`,
    `gamers_games_new`.`game`,
    `gamers_games_new`.`date`,
    `gamers_games_new`.`time`
FROM
    `bd1`.`gamers_games_new`
WHERE 
	`gamers_games_new`.`game` = 100 and `date` = 20171012;
    
    /* 
AND 	
		True	False	UNKNOWN
True	True	False 	UNKNOWN
False	False	False	False
UNKNOWN	UNKNOWN	False	UNKNOWN	

OR
		True	False	UNKNOWN
True	True	False 	True
False	True	False	UNKNOWN
UNKNOWN	True	UNKNOWN	UNKNOWN	

NOT
True	True	
False	True
UNKNOWN	UNKNOWN	

*/

# РЕзультаты сравнения с NULL-значениями

SELECT `gamers`.`idgamers`,
    `gamers`.`name`,
    `gamers`.`country`,
    `gamers`.`favourite_game`,
    `gamers`.`date_of_birth`
FROM `bd1`.`gamers`
where `gamers`.`favourite_game` >= 100 and `country` > 'A';
#NULL-значения не отбираются при помощи операции сравнения 

#Для выборки, содержающей NULL-значение нужно воспользоваться конструкцией IS NULL
SELECT `gamers`.`idgamers`,
    `gamers`.`name`,
    `gamers`.`country`,
    `gamers`.`favourite_game`,
    `gamers`.`date_of_birth`
FROM `bd1`.`gamers`
where `gamers`.`favourite_game` >= 100 and `country` > 'A' 
	or `country` IS NULL
	AND `favourite_game` IS NOT NULL;
    

SELECT `gamers`.`idgamers`,
    `gamers`.`name`,
    `gamers`.`country`,
    `gamers`.`favourite_game`,
    `gamers`.`date_of_birth`
FROM `bd1`.`gamers`
where `gamers`.`favourite_game` >= 100 and `country` > 'A' 
	or `country` IS NULL
	AND `favourite_game` IS NULL;
    
#Объединение нескольких условий при помощи логических операторов
SELECT 
    *
FROM
    `gamers_games_new`
WHERE
    ((`date` > '2012-10-15'
        and `date` < '2020-10-16')
        AND `time` > 5905);

SELECT 
    *
FROM
    `gamers_games_new`
WHERE
    ((`date` > '2012-10-15'
        and `date` < '2020-10-16')
        AND `time` > '00:59:05');

#AND более приоритетен, чем OR
SELECT 
    *
FROM
    `gamers_games_new`
WHERE
    (`date` = '2017-10-12'
        OR `date` = '2012-10-16'
        AND `time` = '07:00:01');
 
 #NOT приоритетнее, чем AND
SELECT 
    *
FROM
    `gamers_games_new`
WHERE
    (`date` = '2017-10-12'
        OR NOT  `date` = '2012-10-16'
        AND  `time` = '07:00:01');

#Операторы IN, BETWEEN и LIKE
#IN Проверяет принадлежность значение к какому-либо множеству значений
SELECT 
    *
FROM
    `gamers`
WHERE
country NOT IN ('США','Китай','Россия') OR favourite_game IN (103,105);

SELECT 
    *
FROM
    `gamers_games_new`
WHERE
    `date` between '2017-01-12' 
    AND '2017-08-18' and `time` between 90300 and 180000;
    
#Исключение граниченных значений из конструктора BETWEEN
SELECT 
    *
FROM
    `games`
WHERE
	`price` BETWEEN '15' AND '99999.99'
    AND NOT price IN (15.00, 99999.99);
    
/* Верхняя граница  значение строки, задаваемая одним символом,
не включает значения, начинающие на этот символ */    
    SELECT 
    *
FROM
    `games`
WHERE
developer BETWEEN 'B' AND 'U';

SELECT 
    *
FROM
    `games`
WHERE
	developer LIKE 'T%';

SELECT 
    *
FROM
    `games`
WHERE
	developer LIKE '_e%';
    
    SELECT 
    *
FROM
    `games`
WHERE
	developer LIKE '%a%a%' AND developer LIKE '____a%';
    
SELECT DISTINCT 
    *
FROM
    `games`
WHERE
	country LIKE 'К_тай';
 
#Использование символов исключения для поиска '%' и'_' в данных 
#Если нужно найти сам символ исключения в данных, его нужно повторить в запросе два раза 
 SELECT 
    *
FROM
    `games`
WHERE
	developer LIKE '%$$%$_%' escape '$';
    
#Агрегатные функции  COUNT(), SUM(), AVG(), MAX(), MIN()
 SELECT 
    count(*)
FROM
    `games`
WHERE
	developer LIKE '%a%';
    
 SELECT  count(distinct developer);
 
 SELECT
	count(all developer)
FROM
    `games`;

Select 
	AVG(YEAR(`date`))
FROM
	`bd1`.`gamers_games_new`;
#Подсчет количество значений, полученных в результате отбора 
Select 
	Count(*)
From
	games
Where
	price > 0;
 
 #Арифметические выражения внутри агрегатной функции 
Select  
	avg(price) * 83 
from
    games
WHERE
	price < 120;
    
#Группировка и агрегатные функции
select 
	gamers, avg(time)
from
	gamers_games_new
group by gamers;

Select
gamers ,`date`, max(time)
From
	gamers_games_new
Group by gamers, `date`;
/*#Неверная форма условия отбора - сравнение значения с агрегатной функцией в предложении WHERE
Select
gamers ,`date`, max(time)
From
	gamers_games_new
where 
	max(time) > '01:00:01'
Group by gamers, `date`;
*/
Select
	gamers ,`date`, max(time)
From
	gamers_games_new
Group by gamers, `date`
HAVING MAX(`time`) < '01:00:00';
/*Использование полей исходной таблицы в предложении HAVING не имеет смысла, так как сравнение происходит после группировки, значение в полях могут быть недоступны
Select
	gamers, `date`, max(time)
From
	gamers_games_new
Group by gamers,
HAVING `date` ='2016-07-02';
*/
Select
	gamers , max(time)
From
	gamers_games_new
WHERE
	`date` = '2015-12-12'
Group by gamers;
#Отбор при помощи HAVING и значений допускается на агрегатными функциями, допускается только в том случае, если после группировки у нас получились значения в колонках, используемые в условии 
Select
	gamers ,`date`, max(time)
From
	gamers_games_new
Group by gamers, `date`
HAVING `date` BETWEEN '2016-01-01'and'2019-01-01';
/*Недопустимое использование вложенные агрегатные функции
Select
	gamers ,`date`, avg(max(`time`))
From
	gamers_games_new
Group by gamers, `date`;
*/


    
           
