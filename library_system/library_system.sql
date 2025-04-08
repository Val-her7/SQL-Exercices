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