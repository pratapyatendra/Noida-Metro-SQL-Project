Noida Metro Ticket Booking System (SQL & PL/SQL)
=================================================

This project is a mini database management system developed in Oracle SQL Developer to simulate a Noida Metro Ticket Booking System.
It demonstrates real-time SQL & PL/SQL concepts such as:

- Database schema design
- Sequences for auto-generated IDs
- Procedures for ticket booking
- Fare calculation
- SmartCard & QR Ticket management
- Default values and validations

-------------------------------------------------
Features
-------------------------------------------------
- Stations Table → Stores metro station details.
- Passengers Table → Stores passenger details with balance & card type (SmartCard or QR).
- Tickets Table → Stores booking records with fare & journey details.
- Sequences → Auto-generate IDs for passengers, tickets, etc.
- Stored Procedure (ticket_booking_system):
  - Accepts passenger name, start station, and end station.
  - Calculates fare automatically.
  - If passenger is new → inserts with default QR ticket.
  - If passenger uses SmartCard → fare is deducted from balance.
  - If insufficient balance → booking fails.
  - Saves booking details with timestamp.

-------------------------------------------------
Database Schema
-------------------------------------------------
- Station(station_id, station_name, line_id)
- Passenger(passenger_id, name, card_type, balance)
- Ticket(ticket_id, passenger_id, start_station, end_station, fare, journey_date)

-------------------------------------------------
Example Usage
-------------------------------------------------
BEGIN
    ticket_booking_system('Rahul Sharma', 'Noida Electronic City', 'Botanical Garden');
END;
/

-- Output (example):
-- QR Ticket booked for Rahul Sharma | From: Noida Electronic City | To: Botanical Garden | Fare: 60

-------------------------------------------------
Setup
-------------------------------------------------
1. Clone this repository:
   git clone https://github.com/your-username/noida-metro-sql.git

2. Open in Oracle SQL Developer.
3. Run the schema creation scripts.
4. Load sample data (stations & passengers).
5. Run stored procedures to simulate bookings.

-------------------------------------------------
Learning Outcomes
-------------------------------------------------
- Understanding of RDBMS schema design.
- Practical use of PL/SQL procedures & exception handling.
- Implementation of default values and auto-increment IDs using sequences.
- Hands-on with real-time project scenario (metro ticketing).

Author: Yatendra Pratap
Project built as part of SQL & PL/SQL learning.
