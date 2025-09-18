-- 1. CREATE DATABASE
CREATE DATABASE IF NOT EXISTS Library_Management_System;
USE Library_Management_System;

-- 2. CREATE AUTHORS TABLE
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    country VARCHAR(50),
    UNIQUE (first_name, last_name)
);

-- 3. CREATE BOOKS TABLE
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    publication_year INT,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE
);

-- 4. CREATE MEMBERS TABLE
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE NOT NULL
);

-- 5. CREATE LOANS TABLE (Junction Table for Many-to-Many Relationship)
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE
);

-- Note on Constraints:
-- PRIMARY KEY: Ensures each record is uniquely identified.
-- AUTO_INCREMENT: Automatically generates a unique number for new records.
-- NOT NULL: Guarantees a value must be provided for the column.
-- UNIQUE: Ensures all values in a column are distinct.
-- FOREIGN KEY: Establishes a link to another table, enforcing referential integrity.
-- ON DELETE CASCADE: If a referenced row in the parent table is deleted, all rows in the child table that reference it are also deleted.
