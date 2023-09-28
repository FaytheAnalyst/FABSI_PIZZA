select 
	O.order_id, 
    O.delivery, 
    O.quantity, 
    O.created_at, 
    M.item_name, 
    M.item_cat, 
    M.item_price,
    M.item_size,
    A.delivery_address1, 
    A.delivery_address2, 
    A.delivery_city, 
    A.delivery_zipcode
from orders AS o
left join menu AS M
ON O.item_id = M.item_id 
left join address AS A
ON o.add_id = A.add_id 
