-- 1. Retrieve all successful bookings:
create view successful_bookings as
select * from ola.bookings
where Booking_Status = 'Success';
-- Answer 1. Retrieve all successful bookings: 
select * from successful_bookings;


-- 2. Find the average ride distance for each vehicle type:
create view avg_vehicle_types as 
select Vehicle_Type, avg(Ride_Distance)
as avg_distance from ola.bookings
group by Vehicle_Type;
-- Answer 2. Find the average ride distance for each vehicle type:
select * from avg_vehicle_types;

-- 3. Get the total number of cancelled rides by customers:
create view count_cancelled_ride_by_customers as
select count(*) from ola.bookings
where Booking_Status = "Canceled_Rides_by_Customer";
-- Answer -- 3. Get the total number of cancelled rides by customers:
select * from count_cancelled_ride_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:
create view Top_5_customers as 
select Customer_ID, count(Booking_ID) as total_rides 
from ola.bookings
group by Customer_ID
order by total_rides desc limit 5;
-- Answer 4. List the top 5 customers who booked the highest number of rides:
select * from Top_5_customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view cancelled_by_drivers as
select count(*) from ola.bookings
where Canceled_Rides_by_Driver = "Personal & Car releated issue";
-- Answer -- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from cancelled_by_drivers;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view min_max_driver_ratings as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from ola.bookings where Vehicle_Type = "Prime Sedan";
-- Answer min_max_driver_ratings for Prime Sedan
select * from min_max_driver_ratings;

-- 7. Retrieve all rides where payment was made using UPI:
create view Pay_UPI as
select * from ola.bookings
where Payment_Method = "UPI";
-- Answer  Retrieve all rides where payment was made using UPI:
select * from Pay_UPI;

-- 8. Find the average customer rating per vehicle type:
create view Avg_Customer_Rating as
select Vehicle_Type, avg(Customer_Rating) as Avg_Cust_Rating
from ola.bookings
group by Vehicle_Type;
-- 9. Calculate the total booking value of rides completed successfully:
create view Total_values as
select  SUM(Booking_Value) as total_success_value
from bookings
where Booking_Status = "Success";
-- Answer  total booking value of rides completed successfully:
select * from Total_values;


-- 10. List all incomplete rides along with the reason:
create view incomplete_rides as 
select Booking_ID, Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = "Yes";

-- Answer 
select *  from incomplete_rides;