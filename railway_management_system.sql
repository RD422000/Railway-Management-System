-- Create the database
CREATE DATABASE RailwayManagementSystem;
USE RailwayManagementSystem;

-- Create the Stations table
CREATE TABLE Stations (
    StationID INT PRIMARY KEY AUTO_INCREMENT,
    StationName VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);

-- Create the Trains table
CREATE TABLE Trains (
    TrainID INT PRIMARY KEY AUTO_INCREMENT,
    TrainName VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL
);

-- Create the Schedules table
CREATE TABLE Schedules (
    ScheduleID INT PRIMARY KEY AUTO_INCREMENT,
    TrainID INT,
    DepartureStationID INT,
    ArrivalStationID INT,
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (DepartureStationID) REFERENCES Stations(StationID),
    FOREIGN KEY (ArrivalStationID) REFERENCES Stations(StationID)
);

-- Create the Passengers table
CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DateOfBirth DATE,
    Gender VARCHAR(10)
);

-- Create the Bookings table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    PassengerID INT,
    ScheduleID INT,
    SeatNumber VARCHAR(10),
    BookingDate DATETIME,
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (ScheduleID) REFERENCES Schedules(ScheduleID)
);

-- Create the Staff table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Position VARCHAR(100)
);

-- Create the TrainAssignments table (linking staff to trains)
CREATE TABLE TrainAssignments (
    AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
    TrainID INT,
    StaffID INT,
    AssignmentDate DATETIME,
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Insert sample data into the Stations table
INSERT INTO Stations (StationName, Location) VALUES 
('Station A', 'City A'),
('Station B', 'City B'),
('Station C', 'City C');

-- Insert sample data into the Trains table
INSERT INTO Trains (TrainName, Capacity) VALUES 
('Express 1', 200),
('Express 2', 150),
('Local 1', 100);

-- Insert sample data into the Schedules table
INSERT INTO Schedules (TrainID, DepartureStationID, ArrivalStationID, DepartureTime, ArrivalTime) VALUES 
(1, 1, 2, '2024-07-18 08:00:00', '2024-07-18 10:00:00'),
(2, 2, 3, '2024-07-18 12:00:00', '2024-07-18 14:00:00'),
(3, 1, 3, '2024-07-18 16:00:00', '2024-07-18 20:00:00');

-- Insert sample data into the Passengers table
INSERT INTO Passengers (FirstName, LastName, DateOfBirth, Gender) VALUES 
('John', 'Doe', '1980-01-01', 'Male'),
('Jane', 'Smith', '1990-02-02', 'Female');

-- Insert sample data into the Bookings table
INSERT INTO Bookings (PassengerID, ScheduleID, SeatNumber, BookingDate) VALUES 
(1, 1, 'A1', '2024-07-17 10:00:00'),
(2, 2, 'B1', '2024-07-17 11:00:00');

-- Insert sample data into the Staff table
INSERT INTO Staff (FirstName, LastName, Position) VALUES 
('Alice', 'Brown', 'Conductor'),
('Bob', 'Johnson', 'Engineer');

-- Insert sample data into the TrainAssignments table
INSERT INTO TrainAssignments (TrainID, StaffID, AssignmentDate) VALUES 
(1, 1, '2024-07-18 08:00:00'),
(2, 2, '2024-07-18 12:00:00');
