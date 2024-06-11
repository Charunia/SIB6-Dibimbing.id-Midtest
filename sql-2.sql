CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

SELECT DISTINCT item
FROM (
    SELECT item, COUNT(*) AS total_count
    FROM item_bought
    GROUP BY item
) AS item_counts
WHERE item_counts.total_count NOT IN (
    SELECT MAX(total_count)
    FROM (
        SELECT COUNT(*) AS total_count
        FROM item_bought
        GROUP BY item
    ) AS max_counts
)
AND item_counts.total_count NOT IN (
    SELECT MIN(total_count)
    FROM (
        SELECT COUNT(*) AS total_count
        FROM item_bought
        GROUP BY item
    ) AS min_counts
);