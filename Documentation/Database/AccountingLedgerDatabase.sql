use sys;

# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          AccountingLedgerApp                             #
# ---------------------------------------------------------------------- #

DROP DATABASE IF EXISTS accounting_ledger;

CREATE DATABASE IF NOT EXISTS accounting_ledger;

use accounting_ledger;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE transactions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `date` DATE,
    `time` TIME,
    `description` VARCHAR(255),
    vendor VARCHAR(100),
    amount DECIMAL(10 , 2 ),
    UNIQUE INDEX unique_transaction (`date` , `time` , `description` , vendor , amount),
    INDEX idx_date_vendor (`date` , `vendor`),
    INDEX idx_amount (amount)
);

CREATE TABLE users (
    user_id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    hashed_password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_id)
);

# ---------------------------------------------------------------------- #
# Inserting Values                                                       #
# ---------------------------------------------------------------------- #

INSERT INTO users (username, hashed_password, role) 
VALUES  ('user','$2a$10$NkufUPF3V8dEPSZeo1fzHe9ScBu.LOay9S3N32M84yuUM2OJYEJ/.','ROLE_USER'),
        ('admin','$2a$10$lfQi9jSfhZZhfS6/Kyzv3u3418IgnWXWDQDk7IbcwlCFPgxg9Iud2','ROLE_ADMIN'),
        ('george','$2a$10$lfQi9jSfhZZhfS6/Kyzv3u3418IgnWXWDQDk7IbcwlCFPgxg9Iud2','ROLE_USER');

INSERT INTO transactions (`date`, `time`, `description`, vendor, amount)
VALUES  ('2024-01-17', '12:00:00', 'For rent', 'Landlord', 1500.00),
        ('2024-01-18', '15:45:00', 'Service payment', 'ABC Services', 120.75),
        ('2024-01-18', '17:00:00', 'Office supplies', 'Office Supplies Inc.', 75.20);


