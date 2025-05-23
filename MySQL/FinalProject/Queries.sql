-- Translated data inserts for FinalProject schema

USE `FinalProject`;

-- 1. Development companies
INSERT INTO `DevelopmentCompany` (Name, Description) VALUES
('Atos', 'Monedero virtual asociado a tu cuenta bancaria'),
('CloudApp', 'Aplicación para gestionar recursos en la nube'),
('SocialTech', 'Red social para compartir fotos y mensajes'),
('OnlineShop', 'Plataforma de comercio electrónico'),
('SoundWave', 'Servicio de streaming de música');

-- 2. Application versions
INSERT INTO `AppVersion` (VersionNumber, ReleaseDate) VALUES
(1.0, '2020-06-01'),
(2.5, '2021-03-15'),
(3.8, '2019-09-20'),
(4.2, '2022-01-10'),
(1.1, '2020-11-05');

-- 3. Applications
INSERT INTO `App` (Name, Description, AppVersionID, DevelopmentCompanyID) VALUES
('DigitalWallet', 'Monedero virtual asociado a tu cuenta bancaria', 1, 1),
('CloudApp', 'Aplicación para gestionar recursos en la nube', 2, 2),
('SocialMedia', 'Red social para compartir fotos y mensajes', 3, 3),
('EcommercePlatform', 'Plataforma de comercio electrónico', 4, 4),
('HealthTracker', 'Aplicación para realizar seguimiento de salud', 5, 5);

-- 4. Application statistics
INSERT INTO `AppStats` (AppID, StartDate, EndDate, Frequency, MetricType, Value) VALUES
(1, '2023-05-01', '2023-05-31', 'Monthly', 'Downloads', 1500.50),
(2, '2023-05-01', '2023-05-31', 'Monthly', 'Revenue', 5000.75),
(3, '2023-05-01', '2023-05-31', 'Monthly', 'ActiveUsers', 2500.00),
(4, '2023-05-01', '2023-05-31', 'Monthly', 'ActiveUsers', 2500.00),
(5, '2023-05-01', '2023-05-31', 'Monthly', 'ActiveUsers', 2500.00);

-- 5. Software types
INSERT INTO `Software` (Name) VALUES
('Windows'),
('Linux'),
('Other');

-- 6. Operating systems
INSERT INTO `OperatingSystem` (Name) VALUES
('Database'),
('ApplicationServer'),
('MicroservicesOrchestrator');

-- 7. VM states
INSERT INTO `VMState` (Name) VALUES
('Running'),
('Stopped'),
('Suspended');

-- 8. Virtual machines
INSERT INTO `VirtualMachine` (Name, Description, CPU, RAM, Storage, OperatingSystemID, VMStateID, DataCenterID, SoftwareID) VALUES
('VM1', 'Virtual machine 1', 6, 4, 100, 1, 1, 1, 1),
('VM2', 'Virtual machine 2', 4, 8, 200, 2, 2, 1, 1),
('VM3', 'Virtual machine 3', 2, 4, 100, 1, 1, 2, 2);

-- 9. Monthly consumption data
INSERT INTO `MonthAmount` (January, February, March, April, May, June, July, August, September, October, November, December) VALUES
(10.231, 10.231, 10.231, 10.231, 10.231, 10.231, 10.231, 10.231, 10.231, 10.231, 10.231, 10.231),
(91.451, 91.451, 91.451, 91.451, 91.451, 91.451, 91.451, 91.451, 91.451, 91.451, 91.451, 91.451),
(19.451, 19.451, 19.451, 19.451, 19.451, 19.451, 19.451, 19.451, 19.451, 19.451, 19.451, 19.451);

-- 10. Data centers
INSERT INTO `DataCenter` (Location, CurrentLoad, ReservedResources, FreeResources, MonthAmountID, Latitude, Longitude) VALUES
('Madrid', 20, 10, 70, 1, 40.4168, -3.7038),
('Barcelona', 30, 20, 50, 2, 51.5074, -0.1278),
('Seville', 30, 30, 40, 3, -37.8136, 144.9631);

-- 11. Request rates
INSERT INTO `RequestRate` (RequestsPerSecond, RequestsPerMinute, RequestsPerHour) VALUES
(1, 10, 1),
(2, 2, 1);

-- 12. Load balancing policies
INSERT INTO `BalancePolicy` (Name) VALUES
('Round Robin'),
('FIFO'),
('FILO');

-- 13. Load balancers
INSERT INTO `LoadBalancer` (Name, Description, IPdns, BalancePolicyID, RequestRateID, DataCenterID) VALUES
('LoadBalancer 1', 'Balancer for data center', '10123123', 1, 1, 1),
('LoadBalancer 2', 'Balancer for data center', '20232113', 2, 2, 1);

-- 14. Time slots
INSERT INTO `TimeSlot` (StartTime, EndTime) VALUES
('2023-05-25 13:30:00', '2023-05-25 17:00:00'),
('2023-05-25 18:30:00', '2023-05-25 20:00:00');

-- 15. Request states
INSERT INTO `RequestState` (State) VALUES
('OK'),
('NOT OK');

-- 16. Request logs
INSERT INTO `RequestLog` (Quantity, TimeSlotID, RequestStateID) VALUES
(112, 1, 1),
(222, 1, 1);

-- 17. Authentication methods
INSERT INTO `Authentication` (Name) VALUES
('API Key'),
('Bearer Token'),
('X509 Certificate');

-- 18. Daily logs
INSERT INTO `DailyLog` (Morning, Afternoon, Evening) VALUES
(50, 80, 30);

-- 19. Login statistics
INSERT INTO `LoginStats` (LogDate, TimeSlot, Counts, DailyLogID) VALUES
('2023-05-24', 'Morning', 50, 1),
('2023-05-24', 'Afternoon', 80, 2),
('2023-05-24', 'Evening', 30, 3);

-- 20. Logins
INSERT INTO `Login` (ServerID, AuthenticationID, RequestLogID, LoginStatsID) VALUES
(1, 1, 1, 1),
(2, 3, 2, 2);

-- 21. Servers
INSERT INTO `Server` (InternalName, ExternalName, AssignedSpace, AvailableSpace, DataCenterID, LoginID) VALUES
('Server 1', 'Server 1', 20, 12, 1, 1),
('Server 2', 'Server 1', 20, 14, 2, 2);

-- 22. Data center events
INSERT INTO `DataCenterEvent` (DataCenterID, EventDate, EventTime, Consumption) VALUES
(1, '2023-05-25', '13:30:00', 10.231),
(2, '2023-05-25', '18:30:00', 9.451);

-- 23. Application statistics (historical)
INSERT INTO `AppStats` (AppID, StartDate, EndDate, Frequency, MetricType, Value) VALUES
(1, '2019-01-01', '2019-12-31', 'Yearly', 'Downloads', 12000.00);
