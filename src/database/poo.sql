-- Active: 1698703847063@@127.0.0.1@1433
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT (DATETIME())
);

CREATE TABLE accounts (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    owner_id TEXT NOT NULL,
    balance REAL DEFAULT (0) NOT NULL,
    created_at TEXT NOT NULL DEFAULT (DATETIME()),
    FOREIGN KEY (owner_id) REFERENCES users (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

SELECT * FROM users;
DROP TABLE accounts;
INSERT INTO users (id, name, email, password)
VALUES
	('u001', 'Fulano', 'fulano@email.com', 'fulano123'),
	('u002', 'Beltrana', 'beltrana@email.com', 'beltrana00');

INSERT INTO accounts (id, owner_id)
VALUES
	('a001', 'u001'),
	('a002', 'u002');
