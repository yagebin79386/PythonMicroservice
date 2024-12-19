-- Initialize a mysql database for a blog API
-- The blog is a list of articles with comments.
-- Each article has:
-- * an author
-- * a creation date
-- * a title,
-- a body,
-- and a list of comments.
-- An author is an authenticated user.
-- A comment has an author and a body.
-- The database has three tables:
-- * users
-- * articles
-- * comments
-- The users table has:
-- * an id
-- * a username
-- * a password
-- * a role (admin or user)
-- The articles table has:
-- * an id
-- * an author
-- * a title
-- * a body
-- * a creation date
-- The comments table has:
-- * an id
-- * an article_id
-- * an author
-- * a body
-- * a creation date

-- Use the blog database
USE myblog;

-- Create an articles table
CREATE TABLE articles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  author VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a comments table
CREATE TABLE comments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  article_id INT NOT NULL,
  author VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a users table
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  role ENUM('admin', 'user') DEFAULT 'user'
);

-- Insert admin user with username 'admin' and password 'admin'
INSERT INTO users (username, password, role) VALUES ('admin', 'adminP@ssw0rd', 'admin');

-- Insert user with username 'user' and password 'user'
INSERT INTO users (username, password, role) VALUES ('user', 'userP@ssw0rd', 'user');