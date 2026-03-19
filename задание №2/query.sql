
SELECT o.id                                                as order_id,
       c.name                                              as customer_name,
       o.date                                              as order_date,
       p.name                                              as product_name,
       pfo.quantity                                        as order_quantity,
       SUM(mpm.quantity * p2.price / 100)                  as material_cost,
       pfo.quantity * SUM(mpm.quantity * (p2.price / 100)) as total_product_cost
FROM orders o
         INNER JOIN customer c ON o.customer = c.id
         INNER JOIN products_for_order pfo ON o.id = pfo.order_id
         INNER JOIN product p ON pfo.product_id = p.id
         LEFT JOIN product_maps pm ON p.id = pm.main_product_id
         LEFT JOIN materials_for_product_maps mpm ON pm.id = mpm.product_map_id
         LEFT JOIN product p2 ON mpm.material = p2.id
GROUP BY o.id, c.name, o.date, p.name, pfo.quantity;