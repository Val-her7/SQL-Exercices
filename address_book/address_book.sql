CREATE DATABASE IF NOT EXISTS address_book;

CREATE TABLE IF NOT EXISTS contacts(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO contacts
(first_name, last_name, email)
VALUES("Valentin", "Herman", "Valentin.herman@gmail.com"),
      ("Christophe", "Herman", "Christophe.herman@gmail.com"),
      ("Anthony", "Moulin", "Antho.moulin@gmail.com");  

UPDATE contacts
SET email = "Christophe.herman@outlook.com"
where id = 2;

DELETE FROM contacts
WHERE last_name = "Moulin";

INSERT INTO contacts
(first_name, last_name, email)
VALUES("Anthony", "Moulin", "Anthony.moulin@hotmail.com");

ALTER TABLE contacts
ADD phone_number CHARACTER(10) UNIQUE;

UPDATE contacts
SET phone_number = CASE
    WHEN email = "Valentin.herman@gmail.com" THEN "0432481293"
    WHEN email = "Christophe.herman@outlook.com" THEN "0435987766"
    WHEN email = "Anthony.moulin@hotmail.com" THEN "0472341943"
END;    