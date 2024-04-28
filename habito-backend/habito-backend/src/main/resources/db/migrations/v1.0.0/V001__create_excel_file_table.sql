 -- liquibase formatted sql

CREATE TABLE IF NOT EXISTS user (
    uuid VARCHAR(36) NOT NULL PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255),
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    lastLoginTimeStamp TIMESTAMP,
    status VARCHAR(255)
);

-- rollback DROP TABLE user;
