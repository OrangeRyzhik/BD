#Допускаются применения выражений в предложении SELECT
Select
	`country` as 'Страна',"Цена рекомендованная",avg(price) as "Цена",'Цена в России', avg(price) * 1.2 * 81.23 as 'Цена с НДС'
FROM 
	games
where country is not null
Group by country;

#Использование INTERVAL 
SELECT 
	`gamers_games_new`.`idgamers_games_new`,
    `gamers_games_new`.`gamers`,
    `gamers_games_new`.`game`,
    `gamers_games_new`.`date`  'Дата после прошествие 2х недель',
    `gamers_games_new`.`time` + INTERVAL 10 hour
FROM 
	`bd1`.`gamers_games_new`;
#INTERVAL в предложении where
SELECT 
	`gamers_games_new`.`idgamers_games_new`,
    `gamers_games_new`.`gamers`,
    `gamers_games_new`.`game`,
    `gamers_games_new`.`date`
FROM
	bd1.gamers_games_new
Where
	date < '2017-01-01' + INTERVAL 6 month and date > '2016-01-01' - INTERVAL 6 MONTH;
 
 #Применение условных выражений CASE для изменения отображения данных
select
	case `name` 
		when 'Beresnev' Then 'beresnev' 
        when 'Agaeva' Then 'agaeva'
        else `name`
        END
	from 
		`gamers`;
#Сортировка значений 
SELECT
	`gamers`.`idgamers`,
    `gamers`.`name`,
    `gamers`.`country`,
    `gamers`.`favourite_game`,
    `gamers`.`date_of_birth`
FROM `bd1`.`gamers`
order by country;
#Сортировка столбцов с указанием их номера
SELECT
    `gamers`.`name`,
    `gamers`.`country`,
    `gamers`.`favourite_game`,
    `gamers`.`date_of_birth`
FROM `bd1`.`gamers`
order by 2,1;
#Сортировка по агрегатным группам
SELECT
    `gamers`.`country`, MIN(date_of_birth)
FROM 
	`bd1`.`gamers`
where
	country is not null
group by country
order by 1;
#Соединение таблиц 
#"Естественное соединение -отбираются значения в одной таблицы, которые ссылаются на эти же значения (первичный ключ) в другой таблице
select
	`name`, game_name
from 
	`gamers`, `games`
where
	gamers.favourite_game = games.id_game;
#Неестественное соедниение 
select
	`name`, count(game_name)
from 
	`gamers`,
	`games`
where
	gamers.country = games.country and gamers.country = 'США'
group by `name`;
#Использование псевдонимов (alias) для таблиц
select
	`name`, count(game_name)
from 
	`gamers` `игроки`,
	`games` `игры`
where
	`игроки`.country = `игры`.country and `игры`.country='США'
group by `name`;
#Использование неравенств позволяет убрать очевидно лишние пары при сравнении значений между одной и той же таблицы
select
	`name`, count(game_name)
from 
	`gamers` g1,
	`gamers` g2,
    `games` gm
where
	g1.country = gm.country 
		and g1.country = 'США' and g1.date_of_birth = g2.date_of_birth
group by g1.`name`;
#Таблица с циклическими зависимотсями. Соединение таблицы с собой
SELECT t1.сотрудник as начальник, 'над', t2.`сотрудник` as подчиненный FROM bd1.`сотрудники` t1,
bd1.`сотрудники` t2
where 
	t1.`Ид_Сотрудники` = t2.`Номер_Начальник`;
#Преобразование таблицы в колонки по значение страны
SELECT
	a.`game_name` as 'Игры США',
    b.`game_name` as 'Игры Китая',
    c.`game_name` as 'Игры Южной Кореи',
    d.`game_name` as 'Игры России'
FROM
	`bd1`.`games` a,
    `bd1`.`games` b,
    `bd1`.`games` c,
    `bd1`.`games` d;
Where
	a.country = 'США'
		and b.country = 'Китай'
        and c.country = 'Южная Корея'
        and d.country = 'Россия'