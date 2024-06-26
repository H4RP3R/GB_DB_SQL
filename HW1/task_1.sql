/*
 Создайте таблицу (сущность) с мобильными телефонами mobile_phones. При создании необходимо использовать DDL-команды.
 Перечень полей (атрибутов):
 id – числовой тип, автоинкремент, первичный ключ;
 product_name – строковый тип, обязательный к заполнению;
 manufacturer – строковый тип, обязательный к заполнению;
 product_count – числовой тип, беззнаковый;
 price – числовой тип, беззнаковый.
 */
-- При написании запросов указывайте не только имя таблицы, но и схему.
-- Название вашей схемы - itresume9790967
-- Например, itresume9790967.tablename
-- Вы работаете с PostgreSQL
-- Введите свой код ниже
DROP TABLE IF EXISTS itresume9790967.mobile_phones;
CREATE TABLE itresume9790967.mobile_phones (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    manufacturer VARCHAR(50) NOT NULL,
    product_count INT,
    price INT
);
INSERT INTO itresume9790967.mobile_phones (product_name, manufacturer, product_count, price)
VALUES ('iPhone X', 'Apple', 156, 76000),
    ('iPhone 8', 'Apple', 180, 51000),
    ('Galaxy S9', 'Samsung', 21, 56000),
    ('Galaxy S8', 'Samsung', 124, 41000),
    ('P20 Pro', 'Huawei', 341, 36000);