
-- Noida Metro Ticket Booking System SQL Scripts

-- Drop existing tables (for reset purposes)
DROP TABLE ticket CASCADE CONSTRAINTS;
DROP TABLE passenger CASCADE CONSTRAINTS;
DROP TABLE station CASCADE CONSTRAINTS;

-- Create Station Table
CREATE TABLE station (
    station_id INT PRIMARY KEY,
    station_name VARCHAR2(100) NOT NULL
);

-- Create Passenger Table
CREATE TABLE passenger (
    passenger_id INT PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    card_type VARCHAR2(20) DEFAULT 'QR',
    balance NUMBER(10,2) DEFAULT 0
);

-- Create Ticket Table
CREATE TABLE ticket (
    ticket_id INT PRIMARY KEY,
    passenger_id INT REFERENCES passenger(passenger_id),
    start_station INT REFERENCES station(station_id),
    end_station INT REFERENCES station(station_id),
    fare NUMBER(10,2),
    journey_date TIMESTAMP DEFAULT SYSTIMESTAMP
);

-- Insert Sample Stations
INSERT INTO station VALUES (1, 'Noida Electronic City');
INSERT INTO station VALUES (2, 'Sector-62');
INSERT INTO station VALUES (3, 'Sector-59');
INSERT INTO station VALUES (4, 'Sector-52');
INSERT INTO station VALUES (5, 'Noida City Centre');
INSERT INTO station VALUES (6, 'Golf Course');
INSERT INTO station VALUES (7, 'Botanical Garden');

-- Insert Sample Passengers
INSERT INTO passenger VALUES (1, 'Rahul Sharma', 'SmartCard', 500);
INSERT INTO passenger VALUES (2, 'Priya Verma', 'SmartCard', 200);

-- Procedure: Ticket Booking System
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
    -- 1. Get start station ID
    BEGIN
        SELECT station_id INTO v_start_id
        FROM station
        WHERE UPPER(station_name) = UPPER(p_start_station);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Start station "' || p_start_station || '" not found.');
    END;

    -- 2. Get end station ID
    BEGIN
        SELECT station_id INTO v_end_id
        FROM station
        WHERE UPPER(station_name) = UPPER(p_end_station);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20002, 'End station "' || p_end_station || '" not found.');
    END;

    -- 3. Check if passenger exists, else create as QR ticket passenger
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

    -- 4. Calculate fare
    v_fare := ABS(v_end_id - v_start_id) * 10;

    -- 5. Generate ticket_id
    SELECT NVL(MAX(ticket_id),0)+1 INTO v_ticket_id FROM ticket;

    -- 6. Process booking based on card type
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

-- Example Execution
-- BEGIN
--     ticket_booking_system('Rahul Sharma', 'Noida Electronic City', 'Botanical Garden');
-- END;
-- /
