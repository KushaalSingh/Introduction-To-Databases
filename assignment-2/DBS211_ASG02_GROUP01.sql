-- OART 2

-- Question 1

CREATE DATABASE DBS211_Ass2_Group1;

-- Question 2
CREATE TABLE BookingDetails(
	BookingID number,
	BookedOn date
);

  CREATE TABLE FlightDetails(
    Flight_num varchar(10) NOT NULL PRIMARY,
     Airline Code char(5),
     AirlineName varchar(30),
     AircraftCode char(3),
     AircraftDescription varchar(60),
     Dep_date date,
     dep_time time,
     dep_airport_code char(3),
     dep_airport_name varchar(30),
     dep_city varchar(15),
     arr_date date,
     arr_time time,
     arr_airport_code char(3), 
     arr_airport_name varchar(30)
     arr_city varchar(30),
);

CREATE TABLE TicketDetails(
    eticket_num number, NOT NULL UNIQUE PRIMARY,
    BookingIdentification number, FOREIGN REFERNCES BookedOn(BookingID),
    MealPreference varchar(15),
    ticket_price number,
    taxes_fees number
);

CREATE TABLE TravelerDetails(
    TravlerID, number, NOT NULL UNIQUE PRIMARY,
    traveler_Fname, varchar(30), 
    traveler_Lname, varchar(30),
    gender, char(10)
);

--Question 4

INSERT INTO BookingDetails(BookingID, BookedOn)
VALUES 
(56753365, 28-Jan-19),
(56753365, 28-Jan-19),
(56753936, 25-Jan-19),
(56753936, 25-Jan-19);

INSERT INTO FlightDetails(Flight_num, airlineCode, AirlineName, AircraftCode, AircraftDescription, operatedby, Dep_date, dep_time, dep_airport_code, dep_airport_name, dep_city, arr_date, arr_time, arr_airport_code, arr_airport_name, arr_city)
VALUES
('AF393', 'AF', 'Air France', 772, 'BOEING 777 285-305 STD SEATS', 'AF', '22-Jun-19', '9:20 PM', 'YYZ', 'Toronto Pearson Intl Ontario','Toronto', '23-Jun-19', '10:50 AM', 'CDG', 'Charles de Gaul', 'Paris')
('AF5106', 'AF', 'Air France', 322, 'AIRBUS INDUSTRIE JET 200-345 STD SEATS', 'MFA', '23-Jun-19', '1:40 PM', 'CDG', 'Charles de Gaul', 'Paris', '23-Jun-19', '6:55 PM', 'BEY', NULL, 'Beirut')
('AF393', 'AF', 'Air France', 772, 'BOEING 777 285-305 STD SEATS', 'AF', '22-Jun-19', '9:20 PM', 'YYZ', 'Toronto Pearson Intl Ontario' 'Toronto', '23-Jun-19', '10:50 AM', 'CDG', 'Charles de Gaul', 'Paris')
('AF386', 'AF','Air France', 772, 'BOEING 777 285-305 STD SEATS', 'AF', '17-Jul-19', '5:00 PM', 'CDG', 'Charles de Gaul', 'Paris', '17-Jul-19', '7:20 PM', 'YYZ', 'Toronto Pearson Intl Ontario', 'Toronto')

INSERT INTO TicketDetails(eticket_num, BookingIdentification, MealPreference, ticket_price, taxes_fees)
VALUES
(573480996631, 56753936, 'Vegetarian', 1200, 182),
(573480996619, 56753365, 'Halal', 1353, 182),
(573480996620, 56753365, 'Vegetarian', 1142, 180),
(573480996621, 56753365, 'Halal', 1142, 180);

INSERT INTO TravelerDetails(travelerid, traveler_Fname, traveler_Lname, gender)
VALUES
(111, 'Andrew', 'Smith', 'Male'),
(112, 'Mariam', 'Daoud', 'Female'),
(113, 'Yasmine', 'Ch', 'Female'),
(114, 'Hasan', 'Ch', 'Male');

--PART 3

 -- Question 1
 --  List the airline, aircraft and airport details for flight number AF393. Display the flight number,
 -- airline code and name, aircraft code and description, departure airport code and name and arrival airport
 -- code and name.

-- Flight Number: AF393
-- Airline Code: 772
-- Airline Desc: BOEING 777 285-305 STD
-- Departure Airport Code: YYZ
-- Departure Airport Name: Toronto Pearson, Intl
-- Arrival Airport Code: CDG
-- Arrival Airport Name: Chrles de Gaul

SELECT Flight_num, airlineCode, AirlineName, AircraftCode, AircraftDescription, dep_airport_code, dep_airport_name, arr_airport_code, arr_airport_name
FROM FlightDetails

-- Question 2
--   List the flight details for bookingId 56753365. Display booking id, booking date,  the flight number (there should show several flights records for this booking), departure airport code, departure date and time, arrival airport code, arrival date and time. 
--   Order the rows by departure date and time

-- Flight Number: AF5106
-- Airline Code: AF
-- Airline Name: Air France
-- Aircraft Code: 332
-- Aircraft Desc: AIRBUS INDUSTRIE JET 200-345 STD
-- Operated By: MFA
-- Departure Date: 23-Jun-19
-- Departure Time: 1:40 PM
-- Deperature Airport Code: CDG
-- Departure Airport Name: Charles de Gaul
-- Departure City: Paris
-- Arrival Date: 23-Jun-19
-- Arrival Time: 6:55 PM
-- Arrival Airport Code: BEY
-- Arrival Airport Name: NULL
-- Arrival Airport City: Beirut

SELECT BookingDetails.bookingID, BookingDetails.BookedOn, FlightDetails.flightnum, FlightDetails.dep_airport_code, FlightDetails.dep_time, FlightDetails.arr_airport_code, FlightDetails.arr_time
FROM BookedOn, FlightDetails
ORDER BY dep_time;

-- Question 3
-- List all passengers for bookingID 56753365. Display the bookingID, eticket number, traveler first and last name.
-- This should show 3 passengers with 3 different etickets. 

-- Passengers: Mariam Daoud, Yasmine Ch, Hasan Ch

SELECT BookingDetails.bookingID, TicketDetails.eticket_num, TravelerDetails.traveler_fname, TravelerDetails.traveler_Lname
FROM BookingDetails, TicketDetails, TravelerDetails;

-- Question 4
-- 4-	Calculate the total fees for bookingID 56753365. This should be the sum of ticket price and tax fees for the three tickets associated with this booking. 
--      (Hint: this does not need a group by).
-- Use a where clause to select only the tickets for that booking and use the sum() function. 

SELECT SUM(ticket_price) + SUM(taxes_fees)
FROM TicketDetails
WHERE bookingID = 56753365 ;

-- Question 5
-- Create a view named as Book_ticket. In the view show the list of all bookings and the number of tickets associated with each.  

CREATE VIEW [Book_ticket] AS
SELECT bookingID, COUNT(tickets)
FROM BookingDetails;




