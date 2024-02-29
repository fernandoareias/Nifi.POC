
CREATE SCHEMA IF NOT EXISTS microservice01;
CREATE SCHEMA IF NOT EXISTS legacy01;


CREATE TABLE IF NOT EXISTS legacy01.Client (
    id SERIAL PRIMARY KEY,
    correlation_id UUID not NULL, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    des_name VARCHAR(125) not null,
    active BOOLEAN DEFAULT true
);

ALTER TABLE legacy01.Client REPLICA IDENTITY FULL;


CREATE TABLE IF NOT EXISTS microservice01.Client (
    id SERIAL PRIMARY KEY,
    correlation_id UUID not NULL, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    des_name VARCHAR(125) not null,
    active BOOLEAN DEFAULT true
);

ALTER TABLE microservice01.Client REPLICA IDENTITY FULL;

INSERT INTO legacy01.Client (correlation_id, des_name, active)
SELECT 
    '123e4567-e89b-12d3-a456-426614174000' AS correlation_id,
    'Cliente ' || (ROW_NUMBER() OVER ()) AS des_name,
    CASE WHEN random() > 0.5 THEN true ELSE false END AS active
FROM 
    generate_series(1, 1000);


update legacy01.Client set des_name = 'Ajustando nome do cliente' where id IN (
    SELECT id FROM legacy01.Client ORDER BY RANDOM() LIMIT 100
);
