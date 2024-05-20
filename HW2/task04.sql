-- Вы работаете с MySQL
-- Введите свой код ниже
SELECT id,
    CASE
        WHEN order_status = 'OPEN' THEN 'Order is in open state'
        WHEN order_status = 'CLOSED' THEN 'Order is closed'
        WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
    END AS status
FROM orders;