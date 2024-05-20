ALTER TABLE itresume9790967.mobile_phones
ADD COLUMN manufacturer_id INT;

ALTER TABLE itresume9790967.mobile_phones
ADD CONSTRAINT ph_man_id FOREIGN KEY (manufacturer_id) REFERENCES itresume9790967.manufacturer(id) ON UPDATE CASCADE ON DELETE
SET NULL;

UPDATE itresume9790967.mobile_phones
SET manufacturer_id = (
        SELECT id
        FROM itresume9790967.manufacturer
        WHERE name = mobile_phones.manufacturer
    );

ALTER TABLE itresume9790967.mobile_phones DROP COLUMN manufacturer;