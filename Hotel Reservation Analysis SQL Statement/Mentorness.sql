SELECT * FROM hotel;

-- 1 What is the total number of reservations in the dataset?
SELECT COUNT  (*)
FROM hotel;
 
 
-- 2 Which meal plan is the most popular among guests?
SELECT type_of_meal_plan, COUNT (*) AS count_
FROM hotel 
GROUP BY type_of_meal_plan
ORDER BY count_ DESC
LIMIT 1;


-- 3 What is the average price per room for reservations involving children? 
SELECT AVG (avg_price_per_room)
FROM hotel
WHERE no_of_children > 0;


-- 4 How many reservations were made for the year 2018 (replace XX with the desired year)?
SELECT COUNT (room_type_reserved)
FROM hotel 
WHERE arrival_date >= '2018-01-01' AND arrival_date <= '2018-12-31' ;


-- 5 What is the most commonly booked room type? 
SELECT room_type_reserved, COUNT (*) AS count_ 
FROM hotel
GROUP BY room_type_reserved
ORDER BY count_ DESC
LIMIT 1;


-- 6 How many reservations fall on a weekend (no_of_weekend_nights > 0)? 
SELECT DISTINCT no_of_weekend_nights
FROM hotel;

SELECT COUNT (no_of_weekend_nights) AS weekend_count
FROM hotel
WHERE no_of_weekend_nights > 0;


-- 7 What is the highest and lowest lead time for reservations? 
SELECT MAX (lead_time) AS highest
FROM hotel;

SELECT MIN (lead_time) AS lowest
FROM hotel;

-- 8 What is the most common market segment type for reservations?
SELECT market_segment_type, COUNT (*) AS most_value_count
FROM hotel 
GROUP BY market_segment_type
ORDER BY most_value_count DESC  
LIMIT 1;

-- 9 How many reservations have a booking status of "Confirmed"?
SELECT DISTINCT booking_status 
FROM hotel;

SELECT COUNT (booking_status) AS confirmed_reservation_count 
FROM hotel 
WHERE booking_status = 'Confirmed';

-- 10 What is the total number of adults and children across all reservations? 
SELECT SUM(no_of_adults) AS total_adults, SUM(no_of_children) AS total_children, SUM(no_of_adults + no_of_children) AS total_people
FROM hotel;


-- 11 What is the average number of weekend nights for reservations involving children? 
SELECT ROUND (AVG (no_of_weekend_nights), 4)
FROM hotel;


-- 12 How many reservations were made in each month of the year?
SELECT EXTRACT (MONTH FROM arrival_date) AS reservation_month, COUNT (*) AS reservation_count
FROM hotel
GROUP BY reservation_month
ORDER BY reservation_month;

-- 13 What is the average number of nights (both weekend and weekday) spent by guests for each room type? 

SELECT AVG (no_of_week_nights + no_of_weekend_nights) AS average_of_both_nights
FROM hotel;


-- 14 For reservations involving children, what is the most common room type, and what is the average price for that room type? 
SELECT room_type_reserved, COUNT (*) AS children_bookings
FROM hotel 
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY children_bookings DESC 
LIMIT 1;

SELECT AVG (avg_price_per_room) AS avg_price_for_room_type_1
FROM hotel
WHERE room_type_reserved = 'Room_Type 1' AND no_of_children > 0;

-- 15 Find the market segment type that generates the highest average price per room.
SELECT market_segment_type, AVG (avg_price_per_room) AS average_price
FROM hotel
GROUP BY market_segment_type
ORDER BY average_price DESC
LIMIT 1;






