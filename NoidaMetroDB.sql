
---------------------------- Metro Lines table-1 -------------------------------
create table Metro_Lines(
      line_id int primary key,
      line_name varchar2(250),
      color varchar(200));
      
select * from Metro_Lines;

TRUNCATE TABLE METRO_LINES;

----------------------------- Station table-2 ----------------------------------
create table Station(
      station_id int primary key,
      station_name varchar2(250),
      line_id REFERENCES Metro_Lines(line_id),
      opening_date date
 );
 
----------------------------- Passenger table-3 --------------------------------
create table passenger(
      passenger_id int primary key,
      name varchar2(250),
      card_type varchar2(50),
      balance number(10,2)
);

UPDATE passenger
SET card_type = 'QR'
WHERE card_type IS NULL;
COMMIT;


ALTER TABLE passenger
MODIFY card_type VARCHAR2(20) DEFAULT 'QR' NOT NULL;


----------------------------- Ticket table-4 -----------------------------------
create table ticket(
      ticket_id int primary key,
      passenger_id int REFERENCES passenger(passenger_id),
      start_station int REFERENCES Station(station_id),
      end_station int REFERENCES Station(station_id),
      fare number(10,2),
      journey_date date
);


------------------------------ Train Schedule table-5 --------------------------
create table train_schedule(
      train_id int primary key,
      line_id int REFERENCES Metro_Lines(line_id),
      departure_time TIMESTAMP,
      arrival_time TIMESTAMP
);


----------- Now, I am going to create sequence for auto increment --------------
CREATE SEQUENCE line_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE station_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE passenger_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ticket_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE audit_seq START WITH 1 INCREMENT BY 1;


--------------- Insert the data in Metro_lines table ---------------------------
INSERT INTO metro_lines (line_id, line_name, color) VALUES (1, 'Blue Line', 'Blue');
INSERT INTO metro_lines (line_id, line_name, color) VALUES (2, 'Yellow Line', 'Yellow');
INSERT INTO metro_lines (line_id, line_name, color) VALUES (3, 'Red Line', 'Red');
INSERT INTO metro_lines (line_id, line_name, color) VALUES (4, 'Green Line', 'Green');
INSERT INTO metro_lines (line_id, line_name, color) VALUES (5, 'Violet Line', 'Violet');
INSERT INTO metro_lines (line_id, line_name, color) VALUES (6, 'Magenta Line', 'Magenta');
INSERT INTO metro_lines (line_id, line_name, color) VALUES (7, 'Pink Line', 'Pink');
INSERT INTO metro_lines (line_id, line_name, color) VALUES (8, 'Grey Line', 'Grey');
INSERT INTO metro_lines (line_id, line_name, color) VALUES (9, 'Airport Express Line', 'Orange');
INSERT INTO metro_lines (line_id, line_name, color) VALUES (10, 'Aqua Line', 'Aqua');
INSERT INTO metro_lines (line_id, line_name, color) VALUES (11, 'Rapid Metro Gurugram', '—');

select * from metro_lines order by line_id;


------------------- Insert Data in Station table -------------------------------
-- For Blue Line (Line 1) Main Line:
-- Noida Electronic City ? Dwarka Sector 21
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Noida Electronic City', 1, TO_DATE('2025-01-01','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Sector 62', 1, TO_DATE('2025-01-02','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Sector 59', 1, TO_DATE('2025-01-03','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Sector 61', 1, TO_DATE('2025-01-04','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Sector 52', 1, TO_DATE('2025-01-05','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Sector 34', 1, TO_DATE('2025-01-06','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Botanical Garden', 1, TO_DATE('2025-01-07','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Golf Course', 1, TO_DATE('2025-01-08','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Noida City Centre', 1, TO_DATE('2025-01-09','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Sector 16', 1, TO_DATE('2025-01-10','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Sector 18', 1, TO_DATE('2025-01-11','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Botanical Garden (Interchange)', 1, TO_DATE('2025-01-12','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Mayur Vihar Extension', 1, TO_DATE('2025-01-13','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Akshardham', 1, TO_DATE('2025-01-14','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Yamuna Bank (Interchange)', 1, TO_DATE('2025-01-15','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Indraprastha', 1, TO_DATE('2025-01-16','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Pragati Maidan', 1, TO_DATE('2025-01-17','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Mandi House', 1, TO_DATE('2025-01-18','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Barakhamba Road', 1, TO_DATE('2025-01-19','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Rajiv Chowk (Interchange)', 1, TO_DATE('2025-01-20','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Ramakrishna Ashram Marg', 1, TO_DATE('2025-01-21','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Jhandewalan', 1, TO_DATE('2025-01-22','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Karol Bagh', 1, TO_DATE('2025-01-23','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Rajendra Place', 1, TO_DATE('2025-01-24','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Patel Nagar', 1, TO_DATE('2025-01-25','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Shadipur', 1, TO_DATE('2025-01-26','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Kirti Nagar (Interchange)', 1, TO_DATE('2025-01-27','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Moti Nagar', 1, TO_DATE('2025-01-28','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Ramesh Nagar', 1, TO_DATE('2025-01-29','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Rajouri Garden (Interchange)', 1, TO_DATE('2025-01-30','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Tagore Garden', 1, TO_DATE('2025-01-31','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Subhash Nagar', 1, TO_DATE('2025-02-01','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Tilak Nagar', 1, TO_DATE('2025-02-02','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Janakpuri East', 1, TO_DATE('2025-02-03','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Janakpuri West (Interchange)', 1, TO_DATE('2025-02-04','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Uttam Nagar East', 1, TO_DATE('2025-02-05','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Uttam Nagar West', 1, TO_DATE('2025-02-06','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Dwarka Mor', 1, TO_DATE('2025-02-07','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Dwarka', 1, TO_DATE('2025-02-08','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Dwarka Sector 14', 1, TO_DATE('2025-02-09','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Dwarka Sector 13', 1, TO_DATE('2025-02-10','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Dwarka Sector 12', 1, TO_DATE('2025-02-11','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Dwarka Sector 11', 1, TO_DATE('2025-02-12','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Dwarka Sector 10', 1, TO_DATE('2025-02-13','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Dwarka Sector 9', 1, TO_DATE('2025-02-14','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Dwarka Sector 8', 1, TO_DATE('2025-02-15','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Dwarka Sector 21 (Interchange)', 1, TO_DATE('2025-02-16','YYYY-MM-DD'));

--For Blue Line Branch: 
-- Yamuna Bank ? Vaishali
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Yamuna Bank (Branch)', 1, TO_DATE('2025-02-17','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Laxmi Nagar', 1, TO_DATE('2025-02-18','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Nirman Vihar', 1, TO_DATE('2025-02-19','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Preet Vihar', 1, TO_DATE('2025-02-20','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Karkarduma', 1, TO_DATE('2025-02-21','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Anand Vihar (ISBT)', 1, TO_DATE('2025-02-22','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Kaushambi', 1, TO_DATE('2025-02-23','YYYY-MM-DD'));
INSERT INTO station VALUES (station_seq.NEXTVAL, 'Vaishali (Terminal)', 1, TO_DATE('2025-02-24','YYYY-MM-DD'));

select * from station;


----------------- Insert Data in Passengers table ------------------------------
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Rahul Sharma', 'SmartCard', 500);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Priya Singh', 'SmartCard', 200);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Amit Kumar', 'QR Ticket', 0);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Sneha Verma', 'SmartCard', 350);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Vikram Yadav', 'SmartCard', 150);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Anjali Gupta', 'QR Ticket', 0);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Rohit Mehra', 'SmartCard', 600);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Neha Kapoor', 'SmartCard', 250);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Suresh Raina', 'SmartCard', 450);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Kiran Bhatia', 'QR Ticket', 0);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Manoj Chauhan', 'SmartCard', 300);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Divya Malhotra', 'SmartCard', 200);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Arjun Desai', 'QR Ticket', 0);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Megha Joshi', 'SmartCard', 400);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Deepak Soni', 'SmartCard', 100);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Ritu Sharma', 'SmartCard', 250);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Kunal Singh', 'QR Ticket', 0);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Shweta Tiwari', 'SmartCard', 350);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Nitin Agarwal', 'SmartCard', 150);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Ayesha Khan', 'QR Ticket', 0);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Harsh Patel', 'SmartCard', 500);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Pooja Mishra', 'SmartCard', 300);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Sanjay Rathi', 'SmartCard', 200);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Tanya Arora', 'QR Ticket', 0);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Vivek Saxena', 'SmartCard', 450);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Komal Jain', 'SmartCard', 350);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Rakesh Kumar', 'SmartCard', 100);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Alok Meena', 'QR Ticket', 0);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Simran Kaur', 'SmartCard', 250);
INSERT INTO passenger VALUES (passenger_seq.NEXTVAL, 'Gaurav Pandey', 'SmartCard', 400);

select * from Passenger;

COMMIT;

---------------- Now I am going to Procedure for ticket booking ----------------
CREATE OR REPLACE PROCEDURE ticket_booking_system (
    p_name            IN VARCHAR2,
    p_start_station   IN VARCHAR2,
    p_end_station     IN VARCHAR2
) AS
    v_passenger_id INT;
    v_start_id     INT;
    v_end_id       INT;
    v_fare         NUMBER(10,2);
    v_ticket_id    INT;
    v_card_type    VARCHAR2(20);
    v_balance      NUMBER(10,2);
BEGIN
    
    BEGIN
        SELECT station_id INTO v_start_id
        FROM station
        WHERE UPPER(station_name) = UPPER(p_start_station);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Start station "' || p_start_station || '" not found.');
    END;

    
    BEGIN
        SELECT station_id INTO v_end_id
        FROM station
        WHERE UPPER(station_name) = UPPER(p_end_station);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20002, 'End station "' || p_end_station || '" not found.');
    END;

    
    BEGIN
        SELECT passenger_id, card_type, NVL(balance,0)
        INTO v_passenger_id, v_card_type, v_balance
        FROM passenger
        WHERE UPPER(name) = UPPER(p_name);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            SELECT NVL(MAX(passenger_id),0)+1 INTO v_passenger_id FROM passenger;
            INSERT INTO passenger(passenger_id, name, card_type, balance)
            VALUES (v_passenger_id, p_name, 'QR', 0);
            v_card_type := 'QR';
            v_balance := 0;
    END;

    v_fare := ABS(v_end_id - v_start_id) * 10;

    SELECT NVL(MAX(ticket_id),0)+1 INTO v_ticket_id FROM ticket;

    IF v_card_type = 'SmartCard' THEN
        IF v_balance >= v_fare THEN
            UPDATE passenger
            SET balance = balance - v_fare
            WHERE passenger_id = v_passenger_id;

            INSERT INTO ticket(ticket_id, passenger_id, start_station, end_station, fare, journey_date)
            VALUES (v_ticket_id, v_passenger_id, v_start_id, v_end_id, v_fare, SYSTIMESTAMP);

            DBMS_OUTPUT.PUT_LINE('SmartCard Ticket booked for ' || p_name ||
                                 ' | From: ' || p_start_station || ' | To: ' || p_end_station ||
                                 ' | Fare: ' || v_fare ||
                                 ' | Remaining Balance: ' || (v_balance - v_fare));
        ELSE
            DBMS_OUTPUT.PUT_LINE('Insufficient balance for SmartCard booking.');
        END IF;
    ELSE
        -- Default QR Ticket
        INSERT INTO ticket(ticket_id, passenger_id, start_station, end_station, fare, journey_date)
        VALUES (v_ticket_id, v_passenger_id, v_start_id, v_end_id, v_fare, SYSTIMESTAMP);

        DBMS_OUTPUT.PUT_LINE('QR Ticket booked for ' || p_name ||
                             ' | From: ' || p_start_station || ' | To: ' || p_end_station ||
                             ' | Fare: ' || v_fare);
    END IF;
END;
/

--OUTPUT
SET SERVEROUTPUT ON;
BEGIN
    ticket_booking_system('Rahul Sharma', 'Janakpuri East', 'Mandi House');
END;
/

select * from passenger;
select * from ticket;
select * from station;
commit;





