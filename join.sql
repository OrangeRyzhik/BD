SELECT 
    name, item_id
FROM
    item
JOIN item_consumable
ON `item`.`id` = `item_consumable`.`item_id`;

SELECT 
    title as title_name,
    item_id
FROM
    consumable 
JOIN item_consumable
ON id = consumable_id;


SELECT 
	id,
    name,
    charge,
    item_id
FROM
    item_consumable
right JOIN item
ON id = item_id;