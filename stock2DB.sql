select *
from stockx;

select
s2.ingredient_name,
s2.ordered_weight,
ing.ing_weight,
inv.quantity,
ing.ing_weight * inv.quantity AS total_inv_weight,
(ing.ing_weight * inv.quantity) - s2.ordered_weight AS remaining_weight 
FROM
	( SELECT 
		ingredient_id, 
        ingredient_name,
		sum( ordered_weight ) AS ordered_weight
	  FROM stockx 
      GROUP BY ingredient_name, ingredient_id 
	) s2
	LEFT JOIN inventory inv ON inv.item_id = s2.ingredient_id
	LEFT JOIN ingredient ing ON ing.ing_id = s2.ingredient_id