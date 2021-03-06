
CREATE TABLE bank_records
(
   
   bank_id        INT    NOT NULL,
   account_id			 INT    NOT NULL,
   amount				NUMERIC(18,2),
   balance				NUMERIC(18,2),
   text_1				CHAR(512),
   text_2				CHAR(512),
   reference_1				CHAR(512),
   reference_2			CHAR(512),
   reference_3			CHAR(512),
   transaction_date			DATE,
   value_date			DATE
   
   
   
);

CREATE TABLE third_fourth_credential_names
(
   id INT PRIMARY KEY     NOT NULL,
   bank_id        INT    NOT NULL,
   third_credential_name			CHAR(50),
   fourth_credential_name			CHAR(50),
   third_credential_on				BIT,
   fourth_credential_on				BIT
   
   
);

CREATE TABLE credentials
(
   id INT PRIMARY KEY     NOT NULL,
   bank_id        INT    NOT NULL,
   user_id	     INT     NOT NULL,
   user_credential        CHAR(50),
   password_credential		CHAR(50),
   third_credential			CHAR(50),
   fourth_credential			CHAR(50)
   
);

CREATE TABLE accounts
(
   id INT PRIMARY KEY     NOT NULL,
   bank_id        INT    NOT NULL,
   company_id     INT     NOT NULL,
   name	        CHAR(50)
);


CREATE TABLE banks
(
   id INT PRIMARY KEY     NOT NULL,


   name	        CHAR(50)
);

CREATE TABLE companies
(
   id INT PRIMARY KEY     NOT NULL,


   name	        CHAR(50)
);

CREATE TABLE users_back
(
   id INT PRIMARY KEY     NOT NULL,
   username        CHAR(50)    NOT NULL,
   password     CHAR(64)     NOT NULL,
   name	        CHAR(50)		NOT NULL,
   apikey			CHAR(255)	NOT NULL
);


INSERT INTO users_back (id, username, password, name, apikey) VALUES
(1, 'peter', '000c285457fc971f862a79b786476c78812c8897063c6fa9c045f579a3b2d63f', 'peter', 'd0763edaa9d9bd2a9516280e9044d885'),
(2, 'john', '100c285457fc971f862a79b786476c78812c8897063c6fa9c045f579a3b2d63f', 'john', 'd0763edaa9d9bd2a9516280e9044d882'),
(3, 'joseph', '200c285457fc971f862a79b786476c78812c8897063c6fa9c045f579a3b2d63f', 'joseph', 'd0763edaa9d9bd2a9516280e9044d881');

INSERT INTO banks (id, name) VALUES
(1, 'Banca March'),
(2, 'Popular');

INSERT INTO companies (id, name) VALUES
(1, 'One Investment'),
(2, 'Pepito SL');

INSERT INTO accounts (id, bank_id, company_id, name) VALUES
(1, 1, 1, '654654654'),
(2, 1, 2, '321321321'),
(3, 2, 1, '987987897'),
(4, 2, 1, '000021100');


CREATE TABLE messages (
 
 id SERIAL PRIMARY KEY NOT NULL,
 user_id int NOT NULL,
 body char(255) NOT NULL,
 image_url char(255) NOT NULL,
 created_at timestamp NOT NULL
);


INSERT INTO messages (user_id, body, image_url, created_at) VALUES
(1, 'Visiting New York for the first time. Any suggestions on great places to visit?', '', '2016-07-01 01:00:00'),
(1, 'Wow, the buildings are so big! ', '', '2016-07-05 01:00:00'),
(1, 'So let me tell you what happened last night. I was just hanging out minding my own business and saw the Empire State Building.', '', '2016-07-12 00:00:00'),
(1, 'So I decided to go see it. That''s when the trouble started', '', '2016-07-12 01:00:00');



CREATE TABLE users (
id	SERIAL PRIMARY KEY NOT NULL,
username char(32) NOT NULL,
password char(64) NOT NULL,
email char(50) NOT NULL,
profile_icon char(255) NOT NULL,
apikey char(255) NOT NULL
);


INSERT INTO users (username, password, email, profile_icon, apikey) VALUES
( 'peter', '000c285457fc971f862a79b786476c78812c8897063c6fa9c045f579a3b2d63f', 'peter@example.com', 'peter.jpg', 'd0763edaa9d9bd2a9516280e9044d885'),
('marcia', '4d6b96d1e8f9bfcd28169bafe2e17da6e1a95f71e8ca6196d3affb4f95ca809f', 'marcia@example.com', 'marcia.jpg', 'd0763edaa9d9bd2a9516280e9044d885'),
('cindy', '81ba24935dd9a720826155382938610f1b74ba226e85a7b4ca2ad58cf06664fa', 'cindy@example.com', 'cindy.jpg', 'd0763edaa9d9bd2a9516280e9044d885'),
('mike', 'ef1b839067281c41a6abdf36ff2346700f9cd5f17d8d4e486be9e81c67779258', 'mike@example.com', 'mike.jpg', 'd0763edaa9d9bd2a9516280e9044d885');

