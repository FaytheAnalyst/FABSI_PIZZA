CREATE VIEW stockx AS
SELECT 
    s1.item_name,
    s1.ing_name AS Ingredient_name,
	s1.ing_id as Ingredient_id,
    s1.ing_weight AS Ingredient_weight,
    s1.ing_price AS Ingredient_price,
	s1.order_quantity AS order_quantity,
	s1.recipe_quantity AS recipe_quantity,
    (s1.order_quantity * s1.recipe_quantity ) AS ordered_weight,
    (s1.ing_price / s1.ing_weight ) AS unit_cost,
    ((s1.order_quantity * s1.recipe_quantity ) * ( s1.ing_price / s1.ing_weight )) AS ingredient_cost 
FROM 
(SELECT 
	o.item_id AS item_id,
    M.sku AS SKU,
    M.item_name,
    R.ing_id as Ing_id,
    I.ing_name AS Ing_name,
	I.ing_weight AS Ing_weight,
    I.ing_price AS Ing_price,
    SUM(o.quantity) AS Order_quantity,
    R.quantity AS Recipe_quantity
    
	from orders  o 
		left join Menu M ON o.item_id = M.item_id
		left join recipe R ON M.sku = R.recipe_id
		left join ingredient I ON R.ing_id = I.ing_id

	GROUP BY
		o.item_id,
		M.sku,
		M.item_name,
		r.ing_id,
		r.quantity,
		I.ing_weight,
		I.ing_price 
) s1
