use sys;

# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          AccountingLedgerApp                             #
# ---------------------------------------------------------------------- #

DROP DATABASE IF EXISTS accounting_ledger;

CREATE DATABASE IF NOT EXISTS accounting_ledger;

use accounting_ledger;

CREATE TABLE transactions (
	transaction_id INT primary key auto_increment,
    user_id INT,
    `date` DATE,
    `time` TIME,
    `description` VARCHAR(255),
    vendor VARCHAR(100),
    amount DECIMAL(10 , 2 ),
    UNIQUE INDEX unique_transaction (`date`, `time`, `description`, vendor, amount),
    INDEX idx_date_vendor (`date`, `vendor`),
    INDEX idx_amount (amount)
);


CREATE TABLE users (
    user_id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    hashed_password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE profiles (
    user_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(200) NOT NULL,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id)
        ON UPDATE CASCADE
);

# ---------------------------------------------------------------------- #
# Inserting Values                                                       #
# ---------------------------------------------------------------------- #

INSERT INTO users (username, hashed_password, role) 
VALUES  ('user','$2a$10$NkufUPF3V8dEPSZeo1fzHe9ScBu.LOay9S3N32M84yuUM2OJYEJ/.','ROLE_USER'),
        ('admin','$2a$10$lfQi9jSfhZZhfS6/Kyzv3u3418IgnWXWDQDk7IbcwlCFPgxg9Iud2','ROLE_ADMIN'),
        ('ibra','$2a$10$lfQi9jSfhZZhfS6/Kyzv3u3418IgnWXWDQDk7IbcwlCFPgxg9Iud2','ROLE_USER'),
        ('lawrence', '$2y$10$5cxOAVAYBsbYCuhC177.ku9QUR4biIsFPk8G/5tECMuAxV5ynocyq', 'ROLE_USER'),
        ('daisy', '$2y$10$x3PNXbckpl72eeswXT0B..jxEH0UdpvnFUxKoda3FfvTyvDNWrRKe', 'ROLE_USER'),
        ('shaq', '$2y$10$rZAC5HkWcp7z/olCHX.htuVac5N8HABkoabAMV3UnqgZPCm15yefK', 'ROLE_USER'),
        ('juan', '$2y$10$YSXuDUbAHWgihzDTkMk6w.GUc3Rzy5u5PX798EJqQL7UNjH0QuP4K', 'ROLE_USER'),
        ('omar', '$2y$10$FBXRdqDybCKBUTkfQmdHU.kK.tRXw2rjdPStEZJDkmGNPNYhN.p1u', 'ROLE_USER');
        
INSERT INTO transactions (user_id, `date`, `time`, `description`, vendor, amount)
		# ---------------------------------------------------------------------- #
		# 			    Payments:                                    #
		# ---------------------------------------------------------------------- #
VALUES  (1, '2024-01-17', '12:00:00', 'For rent', 'Landlord', -1500.00),
	(1, '2024-01-19', '09:30:00', 'Grocery shopping', 'SuperMart', -50.50),
	(1, '2024-01-22', '08:00:00', 'Utilities', 'UtilityCo', -200.00),
        (1, '2024-01-25', '10:00:00', 'Coffee meeting', 'Cafe ABC', -15.50),
        (1, '2024-01-28', '16:45:00', 'Dinner with colleagues', 'Restaurant XYZ', -90.50),
        (1, '2023-12-01', '09:00:00', 'Clothing - Nike Store', 'Nike Store', -120.00),
	(1, '2023-12-02', '12:30:00', 'Grocery shopping - Walmart', 'Walmart', -75.50),
	(1, '2023-12-03', '18:00:00', 'Rent payment', 'Landlord Co.', -1500.00),
	(1, '2023-12-04', '15:45:00', 'Dinner at Cheesecake Factory', 'Cheesecake Factory', -90.00),
	(1, '2023-12-05', '14:00:00', 'Clothing - Zara', 'Zara', -80.00),
	(1, '2023-12-06', '20:30:00', 'Movie night - AMC Theatres', 'AMC Theatres', -25.00),
	(1, '2023-12-07', '11:30:00', 'Lunch at Chipotle', 'Chipotle', -15.00),
	(1, '2023-12-08', '17:00:00', 'Clothing - H&M', 'H&M', -50.00),
	(1, '2023-12-09', '08:30:00', 'Grocery shopping - Trader Joe\'s', 'Trader Joe\'s', -60.00),
	(1, '2023-12-10', '22:00:00', 'Concert tickets - Live Nation', 'Live Nation', -120.00),
	(1, '2023-12-11', '14:45:00', 'Dinner at Olive Garden', 'Olive Garden', -75.00),
	(1, '2023-12-12', '19:30:00', 'Clothing - Adidas Store', 'Adidas Store', -100.00),
	(1, '2023-12-13', '10:00:00', 'Coffee at Starbucks', 'Starbucks', -5.50),
	(1, '2023-12-14', '16:30:00', 'Rent payment', 'Landlord Co.', -1500.00),
	(1, '2023-12-15', '12:15:00', 'Lunch at Subway', 'Subway', -10.00),
	(1, '2023-12-16', '21:00:00', 'Clothing - Forever 21', 'Forever 21', -40.00),
	(1, '2023-12-17', '13:45:00', 'Grocery shopping - Kroger', 'Kroger', -70.00),
	(1, '2023-12-18', '18:30:00', 'Movie night - Cineworld', 'Cineworld', -20.00),
	(1, '2023-12-19', '11:45:00', 'Dinner at Red Lobster', 'Red Lobster', -85.00),
	(1, '2023-12-20', '14:00:00', 'Clothing - Uniqlo', 'Uniqlo', -60.00),
	(1, '2023-12-21', '19:45:00', 'Concert tickets - Ticketmaster', 'Ticketmaster', -90.00),
	(1, '2023-12-22', '09:30:00', 'Lunch at McDonald\'s', 'McDonald\'s', -8.00),
	(1, '2023-12-23', '17:15:00', 'Clothing - GAP', 'GAP', -30.00),
	(1, '2023-12-24', '12:00:00', 'Grocery shopping - Whole Foods', 'Whole Foods', -100.00),
	(1, '2023-12-25', '20:00:00', 'Christmas dinner at Chez Panisse', 'Chez Panisse', -150.00),
        
        (2, '2024-01-20', '14:15:00', 'Internet bill', 'ISP Company', -85.00),
	(2, '2024-01-23', '16:30:00', 'Business software subscription', 'Tech Solutions', -150.00),
        (2, '2024-01-26', '09:00:00', 'Equipment purchase', 'TechStore', -500.00),
	(2, '2024-01-29', '11:15:00', 'Marketing expenses', 'Ad Agency', -250.00),
        (2, '2024-01-18', '15:45:00', 'Service payment', 'ABC Services', -120.75),
	(2, '2023-12-01', '12:00:00', 'Rent payment', 'Apartment Complex', -1200.00),
	(2, '2023-12-03', '14:30:00', 'Clothing shopping', 'Fashion Boutique', -150.00),
	(2, '2023-12-05', '18:45:00', 'Dinner at a fancy restaurant', 'Gourmet Bistro', -80.00),
	(2, '2023-12-08', '10:00:00', 'Grocery shopping', 'SuperMart', -60.50),
	(2, '2023-12-11', '15:15:00', 'Movie night', 'Cineplex', -20.00),
	(2, '2023-12-15', '09:30:00', 'Coffee and pastry', 'Café Latte', -10.50),
	(2, '2023-12-18', '12:30:00', 'Lunch at a food court', 'Food Junction', -15.00),
	(2, '2023-12-21', '16:00:00', 'Online clothing shopping', 'OnlineFashionStore', -100.00),
	(2, '2023-12-24', '20:00:00', 'Concert ticket', 'Music Arena', -75.00),
	(2, '2023-12-27', '11:45:00', 'Gym membership renewal', 'Fitness Center', -30.00),
	(2, '2023-12-29', '14:00:00', 'Dinner with friends', 'Local Grill', -40.00),
	(2, '2023-12-02', '08:00:00', 'Monthly utilities', 'UtilityCo', -90.00),
	(2, '2023-12-04', '13:45:00', 'Tech gadget purchase', 'TechStore', -200.00),
	(2, '2023-12-07', '17:30:00', 'Pizza and game night', 'Pizza Haven', -25.00),
	(2, '2023-12-10', '19:00:00', 'Concert merchandise', 'Music Arena', -35.00),
	(2, '2023-12-13', '10:30:00', 'Bookstore visit', 'Book Emporium', -18.50),
	(2, '2023-12-16', '14:15:00', 'Lunch at a new restaurant', 'Taste Explorers', -45.00),
	(2, '2023-12-19', '09:00:00', 'Morning jog essentials', 'Sports Gear', -12.00),
	(2, '2023-12-22', '11:30:00', 'Home décor', 'HomeStyle', -60.00),
	(2, '2023-12-25', '16:45:00', 'Christmas dinner groceries', 'Grocery Haven', -70.00),
	(2, '2023-12-28', '18:30:00', 'Online streaming subscription', 'StreamZone', -15.00),
	(2, '2023-12-31', '21:00:00', 'New Year\'s Eve celebration', 'Event Hall', -100.00),
	(2, '2023-11-01', '12:00:00', 'Rent payment', 'Apartment Complex', -1200.00),
	(2, '2023-11-05', '18:45:00', 'Dinner at a fancy restaurant', 'Gourmet Bistro', -80.00),
	(2, '2023-11-10', '15:15:00', 'Movie night', 'Cineplex', -20.00),
	(2, '2023-11-15', '09:30:00', 'Coffee and pastry', 'Café Latte', -10.50),
	(2, '2023-11-20', '12:30:00', 'Lunch at a food court', 'Food Junction', -15.00),

        (3, '2024-01-21', '11:00:00', 'Lunch with clients', 'Restaurant XYZ', -120.00),
        (3, '2024-01-24', '13:45:00', 'Travel expenses', 'Airline XYZ', -300.00),
        (3, '2024-01-27', '14:30:00', 'Training workshop fee', 'Training Center', -180.00),
	(3, '2024-01-18', '17:00:00', 'Office supplies', 'Office Supplies Inc.', -75.20),
	(3, '2024-01-30', '13:00:00', 'Office furniture', 'Furniture Co.', -700.00),
        (3, '2023-12-05', '11:15:00', 'Entertainment - Movie Tickets', 'Cineplex', -25.50),
	(3, '2023-12-06', '13:30:00', 'Lunch - Chipotle', 'Chipotle', -15.00),
	(3, '2023-12-07', '15:45:00', 'Clothing - H&M', 'H&M', -45.20),
	(3, '2023-12-08', '18:00:00', 'Grocery shopping', 'Local Market', -55.00),
	(3, '2023-12-09', '10:30:00', 'Rent payment', 'Landlord', -1500.00),
	(3, '2023-12-10', '12:00:00', 'Dinner - Red Lobster', 'Red Lobster', -60.00),
	(3, '2023-12-11', '14:30:00', 'Entertainment - Concert Tickets', 'LiveNation', -80.00),
	(3, '2023-12-12', '16:45:00', 'Lunch - Subway', 'Subway', -10.50),
	(3, '2023-12-13', '11:15:00', 'Clothing - Nike', 'Nike Store', -120.00),
	(3, '2023-12-14', '13:00:00', 'Grocery shopping', 'MegaMart', -65.00),
	(3, '2023-12-15', '10:30:00', 'Rent payment', 'Landlord', -1500.00),
	(3, '2023-12-16', '12:00:00', 'Dinner - Cheesecake Factory', 'Cheesecake Factory', 75.50),
	(3, '2023-12-17', '15:45:00', 'Entertainment - Bowling', 'FunBowl', -20.00),
	(3, '2023-12-18', '17:00:00', 'Lunch - McDonald\'s', 'McDonald\'s', -8.20),
	(3, '2023-12-19', '09:30:00', 'Clothing - Gap', 'Gap', -50.00),
	(3, '2023-12-20', '14:15:00', 'Grocery shopping', 'FreshMart', -40.00),
	(3, '2023-12-21', '11:00:00', 'Rent payment', 'Landlord', -1500.00),
	(3, '2023-12-22', '08:00:00', 'Dinner - Outback Steakhouse', 'Outback Steakhouse', -65.00),
	(3, '2023-12-23', '16:30:00', 'Entertainment - Theme Park Tickets', 'WonderWorld', -100.00),
	(3, '2023-12-24', '13:45:00', 'Lunch - Panera Bread', 'Panera Bread', -15.50),

        (4, '2023-11-01', '12:00:00', 'Online subscriptions', 'SubscriptionHub', -20.00),
	(4, '2023-11-02', '14:45:00', 'Marketing materials', 'PrintZone', -120.00),
	(4, '2023-11-03', '16:30:00', 'Team-building event', 'EventPlanner', -250.00),
	(4, '2023-11-04', '09:00:00', 'Office furniture', 'FurniCo', -700.00),
	(4, '2023-11-05', '11:15:00', 'Business travel', 'Airline XYZ', -600.00),
	(4, '2023-11-06', '13:30:00', 'Client dinner', 'FineDine', -150.00),
	(4, '2023-11-07', '15:45:00', 'Advertising campaign', 'Ad Agency', -400.00),
	(4, '2023-11-08', '18:00:00', 'Hardware purchase', 'Tech Supply', -300.00),
	(4, '2023-11-09', '10:30:00', 'Business meeting', 'Client ABC', -180.00),
	(4, '2023-11-10', '12:00:00', 'Software license renewal', 'SoftwareVendor', -100.00),
	(4, '2023-11-11', '14:30:00', 'Office supplies', 'Office Depot', -75.20),
	(4, '2023-11-12', '16:45:00', 'Dinner with colleagues', 'Restaurant XYZ', -90.50),
	(4, '2023-11-13', '11:15:00', 'Marketing expenses', 'Ad Agency', -250.00),
	(4, '2023-11-14', '13:00:00', 'Office furniture', 'Furniture Co.', -700.00),
	(4, '2023-11-15', '10:30:00', 'Phone bill', 'Telecom Provider', -30.00),
	(4, '2023-11-16', '12:00:00', 'For rent', 'Landlord', -1500.00),
	(4, '2023-11-17', '15:45:00', 'Service payment', 'ABC Services', -120.75),
	(4, '2023-11-18', '17:00:00', 'Office supplies', 'Office Supplies Inc.', -75.20),
	(4, '2023-11-19', '09:30:00', 'Grocery shopping', 'SuperMart', -50.50),
	(4, '2023-11-20', '14:15:00', 'Internet bill', 'ISP Company', -85.00),
	(4, '2023-11-21', '11:00:00', 'Lunch with clients', 'Restaurant XYZ', -120.00),
	(4, '2023-11-22', '08:00:00', 'Utilities', 'UtilityCo', -200.00),
	(4, '2023-11-23', '16:30:00', 'Business software subscription', 'Tech Solutions', -150.00),
	(4, '2023-11-24', '13:45:00', 'Travel expenses', 'Airline XYZ', -300.00),
	(4, '2023-11-25', '10:00:00', 'Coffee meeting', 'Cafe ABC', -15.50),
	(4, '2023-11-26', '09:00:00', 'Equipment purchase', 'TechStore', -500.00),
	(4, '2023-11-27', '14:30:00', 'Training workshop fee', 'Training Center', -180.00),
	(4, '2023-11-28', '16:45:00', 'Dinner with colleagues', 'Restaurant XYZ', -90.50),

        (5, '2023-10-01', '12:00:00', 'iPhone purchase', 'Apple Store', -1000.00),
	(5, '2023-10-02', '14:45:00', 'Nike shoes', 'Nike Retail', -120.00),
	(5, '2023-10-03', '16:30:00', 'Amazon Prime subscription', 'Amazon', -15.99),
	(5, '2023-10-04', '09:00:00', 'Dell laptop', 'Dell Store', -800.00),
	(5, '2023-10-05', '11:15:00', 'Starbucks coffee', 'Starbucks', -5.50),
	(5, '2023-10-06', '13:30:00', 'Adidas sportswear', 'Adidas Store', -90.00),
	(5, '2023-10-07', '15:45:00', 'Sony headphones', 'Sony Store', -150.00),
	(5, '2023-10-08', '18:00:00', 'Tesla Model 3 reservation', 'Tesla Motors', -1000.00),
	(5, '2023-10-09', '10:30:00', 'Disney+ subscription', 'Disney', -7.99),
	(5, '2023-10-10', '12:00:00', 'Gucci sunglasses', 'Gucci Boutique', -300.00),
	(5, '2023-10-11', '14:30:00', 'GoPro camera', 'GoPro Store', -250.00),
	(5, '2023-10-12', '16:45:00', 'Samsung Smart TV', 'Samsung Store', -700.00),
	(5, '2023-10-13', '11:15:00', 'Fitbit fitness tracker', 'Fitbit Store', -80.00),
	(5, '2023-10-14', '13:00:00', 'PlayStation 5', 'Sony Store', -499.99),
	(5, '2023-10-15', '10:30:00', 'Coca-Cola case', 'GroceryMart', -12.99),
	(5, '2023-10-16', '12:00:00', 'Kindle e-reader', 'Amazon', -89.99),
	(5, '2023-10-17', '15:45:00', 'Louis Vuitton handbag', 'LV Boutique', -1200.00),
	(5, '2023-10-18', '17:00:00', 'Bose noise-canceling headphones', 'Bose Store', -299.00),
	(5, '2023-10-19', '09:30:00', 'Nintendo Switch', 'GameStop', -299.99),
	(5, '2023-10-20', '14:15:00', 'Spotify Premium subscription', 'Spotify', -9.99),
	(5, '2023-10-21', '11:00:00', 'Canon DSLR camera', 'Canon Store', -699.00),
	(5, '2023-10-22', '08:00:00', 'H&M clothing', 'H&M Store', -50.00),
	(5, '2023-10-23', '16:30:00', 'MacBook Pro', 'Apple Store', -1499.00),
	(5, '2023-10-24', '13:45:00', 'FitFlop sandals', 'FootwearMart', -80.00),
	(5, '2023-10-25', '10:00:00', 'Google Home', 'Google Store', -99.99),
	(5, '2023-10-26', '09:00:00', 'Timberland boots', 'Timberland Store', -120.00),
	(5, '2023-10-27', '14:30:00', 'Puma athletic wear', 'Puma Store', -70.00),
	(5, '2023-10-28', '16:45:00', 'Xbox Series X', 'Microsoft Store', -499.99),
	(5, '2023-10-29', '11:15:00', 'GoDaddy domain registration', 'GoDaddy', -14.99),
	(5, '2023-10-30', '13:00:00', 'Clothing Shopping', 'Gucci', -50.00),

        (6, '2023-11-01', '12:00:00', 'Clothing purchase', 'FashionHub', -80.00),
	(6, '2023-11-02', '14:45:00', 'Rent payment', 'Landlord Realty', -1200.00),
	(6, '2023-11-03', '16:30:00', 'Dinner at a fancy restaurant', 'Gourmet Bistro', 150.00),
	(6, '2023-11-04', '09:00:00', 'Online streaming subscription', 'StreamFlix', -10.00),
	(6, '2023-11-05', '11:15:00', 'Coffee and snacks', 'Cafe Deluxe', -15.50),
	(6, '2023-11-06', '13:30:00', 'Grocery shopping', 'SuperGrocer', -70.00),
	(6, '2023-11-07', '15:45:00', 'Entertainment event tickets', 'ConcertArena', -100.00),
	(6, '2023-11-08', '18:00:00', 'Clothing purchase', 'StyleMart', -60.00),
	(6, '2023-11-09', '10:30:00', 'Rent payment', 'Landlord Realty', -1200.00),
	(6, '2023-11-10', '12:00:00', 'Lunch at a popular restaurant', 'Tasty Bites', -50.00),
	(6, '2023-11-11', '14:30:00', 'Online shopping for gadgets', 'TechHub', -200.00),
	(6, '2023-11-12', '16:45:00', 'Coffee and pastry', 'Cafe Bliss', -8.50),
	(6, '2023-11-13', '11:15:00', 'Clothing purchase', 'FashionHub', -75.00),
	(6, '2023-11-14', '13:00:00', 'Rent payment', 'Landlord Realty', -1200.00),
	(6, '2023-11-15', '10:30:00', 'Movie night', 'CinemaPlex', -25.00),
	(6, '2023-11-16', '12:00:00', 'Dinner at a trendy restaurant', 'Urban Eats', -80.00),
	(6, '2023-11-17', '15:45:00', 'Online gaming subscription', 'GameHub', -15.00),
	(6, '2023-11-18', '17:00:00', 'Clothing purchase', 'StyleMart', -90.00),
	(6, '2023-11-19', '09:30:00', 'Rent payment', 'Landlord Realty', -1200.00),
	(6, '2023-11-20', '14:15:00', 'Concert tickets', 'LiveMusicVenue', -70.00),
	(6, '2023-11-21', '11:00:00', 'Lunch with friends', 'Local Bistro', -40.00),
	(6, '2023-11-22', '08:00:00', 'Clothing purchase', 'FashionHub', -65.00),
	(6, '2023-11-23', '16:30:00', 'Rent payment', 'Landlord Realty', -1200.00),
	(6, '2023-11-24', '13:45:00', 'Online book purchase', 'BookStore', -20.00),
	(6, '2023-11-25', '10:00:00', 'Coffee and pastry', 'Cafe Bliss', -8.50),
	(6, '2023-11-26', '09:00:00', 'Clothing purchase', 'StyleMart', -70.00),
	(6, '2023-11-27', '14:30:00', 'Rent payment', 'Landlord Realty', -1200.00),
	(6, '2023-11-28', '16:45:00', 'Dinner at a fine dining restaurant', 'Gourmet Haven', -120.00),
	(6, '2023-11-29', '11:15:00', 'Movie night with friends', 'CinemaPlex', -30.00),
	(6, '2023-11-30', '13:00:00', 'Clothing purchase', 'FashionHub', -85.00),

        (7, '2023-11-01', '12:00:00', 'Rent payment', 'Property Management', -1200.00),
	(7, '2023-11-02', '14:45:00', 'Clothing purchase', 'Fashion Boutique', -150.00),
	(7, '2023-11-03', '16:30:00', 'Grocery shopping', 'SuperMart', -80.00),
	(7, '2023-11-04', '09:00:00', 'Dinner at Fine Dining', 'FineDine', -100.00),
	(7, '2023-11-05', '11:15:00', 'Coffee at Starbucks', 'Starbucks', -5.50),
	(7, '2023-11-06', '13:30:00', 'Entertainment - Movie Night', 'CinemaPlex', -20.00),
	(7, '2023-11-07', '15:45:00', 'Rent payment', 'Property Management', -1200.00),
	(7, '2023-11-08', '18:00:00', 'Clothing purchase', 'Fashion Boutique', -120.00),
	(7, '2023-11-09', '10:30:00', 'Grocery shopping', 'SuperMart', -60.00),
	(7, '2023-11-10', '12:00:00', 'Lunch at Local Bistro', 'Local Bistro', -25.00),
	(7, '2023-11-11', '14:30:00', 'Snacks at SnackZone', 'SnackZone', -15.00),
	(7, '2023-11-12', '16:45:00', 'Rent payment', 'Property Management', -1200.00),
	(7, '2023-11-13', '11:15:00', 'Clothing purchase', 'Fashion Boutique', -80.00),
	(7, '2023-11-14', '13:00:00', 'Dinner at Fine Dining', 'FineDine', -120.00),
	(7, '2023-11-15', '10:30:00', 'Coffee at Starbucks', 'Starbucks', -5.50),
	(7, '2023-11-16', '12:00:00', 'Entertainment - Concert', 'Music Arena', -75.00),
	(7, '2023-11-17', '15:45:00', 'Rent payment', 'Property Management', -1200.00),
	(7, '2023-11-18', '17:00:00', 'Clothing purchase', 'Fashion Boutique', -90.00),
	(7, '2023-11-19', '09:30:00', 'Grocery shopping', 'SuperMart', -70.00),
	(7, '2023-11-20', '14:15:00', 'Lunch at Local Bistro', 'Local Bistro', -30.00),
	(7, '2023-11-21', '11:00:00', 'Snacks at SnackZone', 'SnackZone', -10.00),
	(7, '2023-11-22', '08:00:00', 'Rent payment', 'Property Management', -1200.00),
	(7, '2023-11-23', '16:30:00', 'Clothing purchase', 'Fashion Boutique', -110.00),
	(7, '2023-11-24', '13:45:00', 'Dinner at Fine Dining', 'FineDine', -80.00),
	(7, '2023-11-25', '10:00:00', 'Coffee at Starbucks', 'Starbucks', -5.50),
	(7, '2023-11-26', '09:00:00', 'Entertainment - Theatre', 'City Theatre', -40.00),
	(7, '2023-11-27', '14:30:00', 'Rent payment', 'Property Management', -1200.00),
	(7, '2023-11-28', '16:45:00', 'Clothing purchase', 'Fashion Boutique', -130.00),
	(7, '2023-11-29', '11:15:00', 'Grocery shopping', 'SuperMart', -90.00),
	(7, '2023-11-30', '13:00:00', 'Lunch at Local Bistro', 'Local Bistro', -35.00),

        (8, '2023-11-01', '12:00:00', 'Clothing shopping', 'FashionEmpire', -150.00),
	(8, '2023-11-02', '14:45:00', 'Dinner at a fancy restaurant', 'FineDine', -100.00),
	(8, '2023-11-03', '16:30:00', 'Rent payment', 'RealEstateCo', -1200.00),
	(8, '2023-11-04', '09:00:00', 'Gym membership', 'FitnessClub', -80.00),
	(8, '2023-11-05', '11:15:00', 'Coffee and snacks', 'CafeDelight', -15.50),
	(8, '2023-11-06', '13:30:00', 'Movie night', 'CinemaCity', -25.00),
	(8, '2023-11-07', '15:45:00', 'Tech gadget purchase', 'TechHub', -200.00),
	(8, '2023-11-08', '18:00:00', 'Grocery shopping', 'SuperMart', -50.00),
	(8, '2023-11-09', '10:30:00', 'Business lunch', 'Local Bistro', -70.00),
	(8, '2023-11-10', '12:00:00', 'Car service', 'AutoCare', -150.00),
	(8, '2023-11-11', '14:30:00', 'Concert ticket', 'LiveMusicVenue', -75.00),
	(8, '2023-11-12', '16:45:00', 'Home decor', 'DecorZone', -60.00),
	(8, '2023-11-13', '11:15:00', 'Bookstore purchase', 'BookWorld', -30.20),
	(8, '2023-11-14', '13:00:00', 'Fitness class', 'FitStudio', -40.00),
	(8, '2023-11-15', '10:30:00', 'Outdoor gear', 'OutdoorAdventure', -90.00),
	(8, '2023-11-16', '12:00:00', 'Lunch with friends', 'LocalEatery', -40.50),
	(8, '2023-11-17', '15:45:00', 'Rent payment', 'RealEstateCo', -1200.00),
	(8, '2023-11-18', '17:00:00', 'Tech accessory', 'GadgetHub', -35.00),
	(8, '2023-11-19', '09:30:00', 'Online shopping', 'ECommerceStore', -80.00),
	(8, '2023-11-20', '14:15:00', 'Dinner at a sushi restaurant', 'SushiDelight', -60.00),
	(8, '2023-11-21', '11:00:00', 'Home improvement', 'HomeFix', -120.00),
	(8, '2023-11-22', '08:00:00', 'Fitness equipment', 'FitnessGear', -150.00),
	(8, '2023-11-23', '16:30:00', 'Movie streaming subscription', 'StreamFlix', -15.99),
	(8, '2023-11-24', '13:45:00', 'Car rental', 'RentACar', -80.00),
	(8, '2023-11-25', '10:00:00', 'Art supplies', 'ArtisticSupply', -25.00),
	(8, '2023-11-26', '09:00:00', 'Coffee and pastry', 'CafeDelight', -10.50),
	(8, '2023-11-27', '14:30:00', 'Tech gadget purchase', 'TechHub', -180.00),
	(8, '2023-11-28', '16:45:00', 'Business dinner', 'Local Bistro', -90.50),
        
        # ---------------------------------------------------------------------- #
	# 				Deposits:                                #
	# ---------------------------------------------------------------------- #
	
	(1, '2024-01-01', '08:00:00', 'Salary - Work', 'ABC Company', 3000.00),
	(1, '2024-01-04', '12:30:00', 'Gift from Mom', 'Mom', 150.00),
	(1, '2024-01-08', '09:00:00', 'Freelance Payment', 'Client XYZ', 500.00),
	(1, '2023-12-10', '15:45:00', 'Birthday Gift', 'Friend A', 100.00),
	(1, '2024-01-16', '11:30:00', 'Bonus - Work', 'ABC Company', 800.00),
	(1, '2024-01-20', '14:00:00', 'Refund - Online Purchase', 'Online Store', 30.00),
	(1, '2024-01-24', '10:30:00', 'Allowance from Dad', 'Dad', 200.00),
	(1, '2024-01-28', '08:45:00', 'Commission - Art Sale', 'Art Gallery', 150.00),
	(1, '2023-08-01', '13:15:00', 'Workshop Payment', 'Workshop Organizer', 120.00),
	(1, '2023-12-15', '18:00:00', 'Consultation Fee', 'Client ABC', 300.00),

        (2, '2024-01-01', '09:00:00', 'Salary - Work', 'XYZ Corporation', 3500.00),
	(2, '2024-01-04', '13:30:00', 'Gift from Sister', 'Sister', 120.00),
	(2, '2024-01-08', '10:00:00', 'Freelance Payment', 'Client PQR', 600.00),
	(2, '2024-01-12', '16:45:00', 'Bonus - Work', 'XYZ Corporation', 900.00),
	(2, '2024-01-16', '12:30:00', 'Refund - Electronics', 'Electronics Store', 50.00),
	(2, '2024-01-20', '15:15:00', 'Allowance from Grandpa', 'Grandpa', 180.00),
	(2, '2024-01-22', '11:30:00', 'Commission - Art Sale', 'Art Expo', 200.00),
	(2, '2024-01-10', '09:45:00', 'Birthday Gift', 'Friend B', 75.00),
	(2, '2024-01-01', '14:15:00', 'Workshop Payment', 'Workshop Host', 80.00),
	(2, '2023-12-09', '19:30:00', 'Consultation Fee', 'Client XYZ', 400.00),

        (3, '2024-01-01', '10:30:00', 'Salary - Work', 'LMN Corporation', 2800.00),
	(3, '2024-01-04', '14:45:00', 'Gift from Dad', 'Dad', 200.00),
	(3, '2024-01-08', '11:15:00', 'Freelance Payment', 'Client DEF', 450.00),
	(3, '2024-01-12', '17:30:00', 'Birthday Gift', 'Friend C', 80.00),
	(3, '2024-01-16', '13:00:00', 'Bonus - Work', 'LMN Corporation', 700.00),
	(3, '2024-01-20', '16:45:00', 'Refund - Clothing', 'Fashion Store', 25.00),
	(3, '2024-01-14', '12:30:00', 'Allowance from Mom', 'Mom', 150.00),
	(3, '2024-01-17', '10:00:00', 'Commission - Art Sale', 'Art Expo', 120.00),
	(3, '2024-01-01', '15:15:00', 'Workshop Payment', 'Workshop Organizer', 90.00),
	(3, '2023-09-05', '20:30:00', 'Consultation Fee', 'Client LMN', 350.00),

        (4, '2024-01-01', '11:00:00', 'Salary - Work', 'OPQ Corporation', 3200.00),
	(4, '2024-01-04', '15:15:00', 'Gift from Uncle', 'Uncle', 180.00),
	(4, '2024-01-08', '11:45:00', 'Freelance Payment', 'Client GHI', 550.00),
	(4, '2024-01-12', '18:00:00', 'Bonus - Work', 'OPQ Corporation', 850.00),
	(4, '2024-01-16', '14:30:00', 'Refund - Gadgets', 'Tech Store', 40.00),
	(4, '2024-01-20', '17:15:00', 'Allowance from Grandma', 'Grandma', 200.00),
	(4, '2024-01-18', '13:00:00', 'Commission - Art Sale', 'Artistic Impressions', 180.00),
	(4, '2024-01-13', '10:45:00', 'Birthday Gift', 'Friend D', 100.00),
	(4, '2024-01-01', '16:30:00', 'Workshop Payment', 'Workshop Host', 110.00),
	(4, '2024-01-05', '21:45:00', 'Consultation Fee', 'Client OPQ', 500.00),

	(5, '2024-01-01', '11:30:00', 'Salary - Work', 'RST Corporation', 2900.00),
	(5, '2024-01-04', '15:45:00', 'Gift from Aunt', 'Aunt', 160.00),
	(5, '2024-01-08', '12:15:00', 'Freelance Payment', 'Client JKL', 480.00),
	(5, '2024-01-12', '18:30:00', 'Bonus - Work', 'RST Corporation', 650.00),
	(5, '2024-01-16', '15:00:00', 'Refund - Books', 'Bookstore', 20.00),
	(5, '2024-01-20', '18:00:00', 'Allowance from Grandpa', 'Grandpa', 220.00),
	(5, '2024-01-16', '13:45:00', 'Commission - Art Sale', 'Creative Minds', 160.00),
	(5, '2024-01-23', '11:30:00', 'Birthday Gift', 'Friend E', 90.00),
	(5, '2024-01-01', '17:00:00', 'Workshop Payment', 'Workshop Organizer', 100.00),
	(5, '2024-01-05', '22:00:00', 'Consultation Fee', 'Client RST', 450.00),

	(6, '2024-01-01', '12:00:00', 'Salary - Work', 'UVW Corporation', 3400.00),
	(6, '2024-01-04', '16:00:00', 'Gift from Cousin', 'Cousin', 130.00),
	(6, '2024-01-08', '12:45:00', 'Freelance Payment', 'Client MNO', 520.00),
	(6, '2024-01-12', '19:00:00', 'Bonus - Work', 'UVW Corporation', 750.00),
	(6, '2024-01-16', '15:30:00', 'Refund - Fashion', 'Fashion Boutique', 35.00),
	(6, '2024-01-20', '18:45:00', 'Allowance from Uncle', 'Uncle', 230.00),
	(6, '2024-01-24', '14:15:00', 'Commission - Art Sale', 'Artistic Creations', 140.00),
	(6, '2024-01-01', '12:00:00', 'Birthday Gift', 'Friend F', 120.00),
	(6, '2023-12-01', '17:30:00', 'Workshop Payment', 'Workshop Host', 120.00),
	(6, '2023-11-05', '22:15:00', 'Consultation Fee', 'Client UVW', 480.00),

	(7, '2024-01-01', '12:30:00', 'Salary - Work', 'XYZ Corporation', 3800.00),
	(7, '2024-01-04', '16:15:00', 'Gift from Grandpa', 'Grandpa', 140.00),
	(7, '2024-01-08', '13:00:00', 'Freelance Payment', 'Client XYZ', 580.00),
	(7, '2024-01-12', '19:30:00', 'Bonus - Work', 'XYZ Corporation', 800.00),
	(7, '2024-01-16', '16:00:00', 'Refund - Electronics', 'Tech Store', 45.00),
	(7, '2024-01-20', '19:15:00', 'Allowance from Aunt', 'Aunt', 250.00),
	(7, '2024-01-24', '14:45:00', 'Commission - Art Sale', 'Artistic Visions', 160.00),
	(7, '2023-12-28', '12:30:00', 'Birthday Gift', 'Friend G', 130.00),
	(7, '2024-01-03', '18:00:00', 'Workshop Payment', 'Workshop Organizer', 130.00),
	(7, '2024-01-04', '22:30:00', 'Consultation Fee', 'Client XYZ', 520.00),

	(8, '2024-01-01', '13:00:00', 'Salary - Work', 'ABC Company', 3100.00),
	(8, '2024-01-04', '16:30:00', 'Gift from Friend', 'Friend H', 110.00),
	(8, '2024-01-08', '13:15:00', 'Freelance Payment', 'Client ABC', 530.00),
	(8, '2024-01-12', '20:00:00', 'Bonus - Work', 'ABC Company', 900.00),
	(8, '2024-01-16', '16:30:00', 'Refund - Gadgets', 'Electronics Store', 60.00),
	(8, '2024-01-20', '19:30:00', 'Allowance from Aunt', 'Aunt', 180.00),
	(8, '2024-01-24', '15:00:00', 'Commission - Art Sale', 'Artistic Expressions', 200.00),
	(8, '2023-12-21', '13:00:00', 'Birthday Gift', 'Friend I', 95.00),
	(8, '2023-10-01', '18:30:00', 'Workshop Payment', 'Workshop Host', 150.00),
	(8, '2023-11-05', '22:45:00', 'Consultation Fee', 'Client ABC', 480.00);

INSERT INTO profiles (user_id, first_name, last_name, email)
VALUES  (1, 'Christian', 'Escano', 'chris.e@gmail.com'),
        (2, 'Ibrahim', 'Farhane', 'ibrahim.f@gmail.com'),
        (3, 'Sahara', 'Tyner-Melgar', 'sahara.t@gmail.com'),
        (4, 'Shaquille', 'Taj', 'shaq.t@gmail.com'),
        (5, 'Lawrence', 'Tejeda', 'lawrence.t@gmail.com'),
        (6, 'Daisy', 'Gonzalez', 'daisy.g@gmail.com'),
        (7, 'Juan', 'Aviles', 'juan.a@gmail.com'),
        (8, 'Omar', 'Odaoud', 'omar.o@gmail.com');

select * from transactions;