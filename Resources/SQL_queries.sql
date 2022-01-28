-- SQL Table Creation & Queries

DROP TABLE vine_games;
DROP TABLE products;
DROP TABLE customers;
DROP TABLE vine_table;

CREATE TABLE review_id_games (
  review_id TEXT PRIMARY KEY NOT NULL,
  customer_id INTEGER,
  product_id TEXT,
  product_parent INTEGER,
  review_date DATE -- this should be in the formate yyyy-mm-dd
);

-- This table will contain only unique values
CREATE TABLE products_games (
  product_id TEXT PRIMARY KEY NOT NULL UNIQUE,
  product_title TEXT
);

-- Customer table for first data set
CREATE TABLE customers_games (
  customer_id INT PRIMARY KEY NOT NULL UNIQUE,
  customer_count INT
);

-- vine table
CREATE TABLE vine_games (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT);

-- Creating all the tables for the other data set: Lawn and Garden
CREATE TABLE review_id_lawn (
  review_id TEXT PRIMARY KEY NOT NULL,
  customer_id INTEGER,
  product_id TEXT,
  product_parent INTEGER,
  review_date DATE -- this should be in the formate yyyy-mm-dd
);

-- This table will contain only unique values
CREATE TABLE products_lawn (
  product_id TEXT PRIMARY KEY NOT NULL UNIQUE,
  product_title TEXT
);

-- Customer table for first data set
CREATE TABLE customers_lawn (
  customer_id INT PRIMARY KEY NOT NULL UNIQUE,
  customer_count INT
);

-- vine table
CREATE TABLE vine_lawn (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT);

SELECT * FROM vine_games;

SELECT vine_lawn.vine, ROUND(AVG(helpful_votes),2) AS "Average helpful_votes", 
ROUND(AVG(total_votes),2) AS "Average total_votes", ROUND(AVG(star_rating),2) AS "Average star_rating"
FROM vine_lawn
GROUP BY vine;

SELECT vine_games.vine, ROUND(AVG(helpful_votes),2) AS "Average helpful_votes",
ROUND(AVG(total_votes),2) AS "Average total_votes", ROUND(AVG(star_rating),2) AS "Average star_rating"
FROM vine_games
GROUP BY vine;

SELECT vine, helpful_votes, total_votes, star_rating
FROM vine_games
ORDER BY helpful_votes DESC
Limit 100;

SELECT vine, count(vine)
FROM vine_games
WHERE helpful_votes > 250
GROUP BY vine;

SELECT vine, count(vine)
FROM vine_games
WHERE total_votes > 250
GROUP BY vine;

SELECT vine, star_rating, count(star_rating)
FROM vine_games
GROUP by vine, star_rating;

SELECT vine, star_rating, count(star_rating)
FROM vine_lawn
GROUP by vine, star_rating;