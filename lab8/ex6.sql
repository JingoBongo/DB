drop table if exists task
CREATE TABLE task (
id INT PRIMARY KEY,
dependent_id INT REFERENCES task
);


INSERT INTO task VALUES 
(3, 2),
(2, 1),
(4, 2),
(5, 0),
(1, 0),
(0, null);


WITH traverse AS (
        SELECT id,dependent_id FROM task
        WHERE id = 3
    UNION ALL
        SELECT task.id,task.dependent_id FROM task
        INNER JOIN traverse
        ON task.id = traverse.dependent_id
)


SELECT id FROM traverse;
