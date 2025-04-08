CREATE DATABASE IF NOT EXISTS library_system;

CREATE TABLE IF NOT EXISTS books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100) NOT NULL,
    publication_year YEAR NOT NULL,
    genre VARCHAR(50) DEFAULT "Unknown",
    available BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE books
MODIFY COLUMN publication_year INT NOT NULL;

INSERT INTO books
(title, author, publication_year)
VALUES ("1984", "George Orwell", 1984),
       ("Hunger Games", "Suzanne Colins", 2008),
       ("Dracula", "Bram Stocker", 1897);

UPDATE books
SET available = FALSE
WHERE author = "George Orwell";

DELETE FROM books
WHERE publication_year < 1900;

INSERT INTO books
(title, author, publication_year)
VALUES ("Dracula", "Bram Stocker", 1905);

-- BONUS 1
ALTER TABLE books
ADD COLUMN price DECIMAL(4,2) NOT NULL; 

UPDATE books
SET price = CASE
    WHEN title = "1984" THEN 4.95
    WHEN title = "Hunger Games" THEN 8.30
    WHEN title = "Dracula" THEN 20.95
END;

-- BONUS 2
ALTER TABLE books
RENAME COLUMN available TO is_available;

-- BONUS 3
CREATE TABLE IF NOT EXISTS authors(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

INSERT INTO authors
(name)
VALUES("George Orwell"),
      ("Suzanne Colins"),
      ("Bram Stocker");

ALTER TABLE books
ADD COLUMN author_id INT NOT NULL;

UPDATE books
SET author_id = CASE
    WHEN author = "George Orwell" THEN 1
    WHEN author = "Suzanne Colins" THEN 2
    WHEN author = "Bram Stocker" THEN 3
END;

ALTER TABLE books
DROP author;

ALTER TABLE books
ADD FOREIGN KEY (author_id) REFERENCES authors(id);