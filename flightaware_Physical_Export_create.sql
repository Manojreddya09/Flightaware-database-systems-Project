-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-02-10 18:28:53.411

-- tables
-- Table: Aircraft
CREATE TABLE Aircraft (
    aircraft_id int  NOT NULL,
    model varchar(30)  NOT NULL,
    capacity int  NOT NULL,
    airline_id int  NOT NULL,
    CONSTRAINT Aircraft_pk PRIMARY KEY (aircraft_id)
);

-- Table: Airline
CREATE TABLE Airline (
    airline_id int  NOT NULL,
    airline_name varchar(25)  NOT NULL,
    CONSTRAINT Airline_pk PRIMARY KEY (airline_id)
);

-- Table: Airport
CREATE TABLE Airport (
    airport_id int  NOT NULL,
    airport_name varchar(30)  NOT NULL,
    airport_country varchar(30)  NOT NULL,
    airport_city varchar(30)  NOT NULL,
    flight_id int  NOT NULL,
    CONSTRAINT Airport_pk PRIMARY KEY (airport_id)
);

-- Table: Booking
CREATE TABLE Booking (
    booking_id int  NOT NULL,
    booking_date date  NOT NULL,
    seat_number int  NOT NULL,
    passenger_id int  NOT NULL,
    flight_id int  NOT NULL,
    airline_id int  NOT NULL,
    CONSTRAINT Booking_pk PRIMARY KEY (booking_id)
);

-- Table: Passenger
CREATE TABLE Passenger (
    passenger_id int  NOT NULL,
    first_name varchar(15)  NOT NULL,
    last_name varchar(15)  NOT NULL,
    email varchar(50)  NOT NULL,
    mobile_number int  NOT NULL,
    ticket_id int  NOT NULL,
    CONSTRAINT Passenger_pk PRIMARY KEY (passenger_id)
);

-- Table: Payment
CREATE TABLE Payment (
    payment_id int  NOT NULL,
    payment_method varchar(20)  NOT NULL,
    amount int  NOT NULL,
    payment_date date  NOT NULL,
    payment_status longtext  NOT NULL,
    booking_id int  NOT NULL,
    CONSTRAINT Payment_pk PRIMARY KEY (payment_id)
);

-- Table: Ticket
CREATE TABLE Ticket (
    ticket_id int  NOT NULL,
    ticket_date date  NOT NULL,
    ticket_status longtext  NOT NULL,
    CONSTRAINT Ticket_pk PRIMARY KEY (ticket_id)
);

-- Table: flight
CREATE TABLE flight (
    flight_id int  NOT NULL,
    flight_status char(8)  NOT NULL,
    arrival_time timestamp  NOT NULL,
    departure_time timestamp  NOT NULL,
    aircraft_id int  NOT NULL,
    airline_id int  NOT NULL,
    CONSTRAINT flight_pk PRIMARY KEY (flight_id)
);

-- foreign keys
-- Reference: Aircraft_Airline (table: Aircraft)
ALTER TABLE Aircraft ADD CONSTRAINT Aircraft_Airline FOREIGN KEY Aircraft_Airline (airline_id)
    REFERENCES Airline (airline_id);

-- Reference: Airport_flight (table: Airport)
ALTER TABLE Airport ADD CONSTRAINT Airport_flight FOREIGN KEY Airport_flight (flight_id)
    REFERENCES flight (flight_id);

-- Reference: Booking_Airline (table: Booking)
ALTER TABLE Booking ADD CONSTRAINT Booking_Airline FOREIGN KEY Booking_Airline (airline_id)
    REFERENCES Airline (airline_id);

-- Reference: Booking_Passenger (table: Booking)
ALTER TABLE Booking ADD CONSTRAINT Booking_Passenger FOREIGN KEY Booking_Passenger (passenger_id)
    REFERENCES Passenger (passenger_id);

-- Reference: Booking_flight (table: Booking)
ALTER TABLE Booking ADD CONSTRAINT Booking_flight FOREIGN KEY Booking_flight (flight_id)
    REFERENCES flight (flight_id);

-- Reference: Passenger_Ticket (table: Passenger)
ALTER TABLE Passenger ADD CONSTRAINT Passenger_Ticket FOREIGN KEY Passenger_Ticket (ticket_id)
    REFERENCES Ticket (ticket_id);

-- Reference: Payment_Booking (table: Payment)
ALTER TABLE Payment ADD CONSTRAINT Payment_Booking FOREIGN KEY Payment_Booking (booking_id)
    REFERENCES Booking (booking_id);

-- Reference: flight_Aircraft (table: flight)
ALTER TABLE flight ADD CONSTRAINT flight_Aircraft FOREIGN KEY flight_Aircraft (aircraft_id)
    REFERENCES Aircraft (aircraft_id);

-- Reference: flight_Airline (table: flight)
ALTER TABLE flight ADD CONSTRAINT flight_Airline FOREIGN KEY flight_Airline (airline_id)
    REFERENCES Airline (airline_id);

-- End of file.

