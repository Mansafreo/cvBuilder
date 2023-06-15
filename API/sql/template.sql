CREATE DATABASE cvbuilder;

USE cvbuilder;

CREATE TABLE users (
  userID varchar(200) NOT NULL,
  username text NOT NULL,
  password varchar(250) NOT NULL,
  email varchar(200) NOT NULL,
  status tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (userID)
);

