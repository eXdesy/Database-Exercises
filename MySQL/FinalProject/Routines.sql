USE `FinalProject`;

-- -----------------------------------------------------
-- FUNCTIONS
-- -----------------------------------------------------
-- 1. Return the percentage of free disk space for a given server.
DELIMITER $$
DROP FUNCTION IF EXISTS func_PercentDiskFree$$
CREATE FUNCTION func_PercentDiskFree(p_ServerID INT)
    RETURNS FLOAT
    DETERMINISTIC
BEGIN
    DECLARE v_Assigned INT;
    DECLARE v_Available INT;
    DECLARE v_PercentFree FLOAT;
    SELECT AssignedSpace, AvailableSpace
      INTO v_Assigned, v_Available
    FROM `FinalProject`.`Server`
    WHERE ServerID = p_ServerID;
    IF v_Assigned = 0 THEN
      RETURN 0;
    END IF;
    SET v_PercentFree = (v_Available / v_Assigned) * 100;
    RETURN v_PercentFree;
END$$
DELIMITER ;

SELECT func_PercentDiskFree(2);

-- 2. Return the percentage of logins handled by a given server.
DELIMITER $$
DROP FUNCTION IF EXISTS func_LoginPercentage$$
CREATE FUNCTION func_LoginPercentage(p_ServerID INT)
    RETURNS FLOAT
    DETERMINISTIC
BEGIN
    DECLARE v_Total INT;
    DECLARE v_ServerCount INT;
    SELECT COUNT(*) INTO v_Total FROM `FinalProject`.`Login`;
    SELECT COUNT(*) INTO v_ServerCount
      FROM `FinalProject`.`Login`
      WHERE ServerID = p_ServerID;
    IF v_Total = 0 THEN
      RETURN 0;
    END IF;
    RETURN (v_ServerCount / v_Total) * 100;
END$$
DELIMITER ;

SELECT func_LoginPercentage(2);

-- 3. Calculate the distance between two data centers (in km) using Haversine formula.
DELIMITER $$
DROP FUNCTION IF EXISTS func_DistanceBetweenDataCenters$$
CREATE FUNCTION func_DistanceBetweenDataCenters(p_DC1 INT, p_DC2 INT)
    RETURNS FLOAT
    DETERMINISTIC
BEGIN
    DECLARE v_Lat1, v_Lon1, v_Lat2, v_Lon2, v_R, v_dLat, v_dLon, v_a, v_c, v_D FLOAT;
    SET v_R = 6371; -- Earth's radius in km
    SELECT Latitude, Longitude INTO v_Lat1, v_Lon1
      FROM `FinalProject`.`DataCenter` WHERE DataCenterID = p_DC1;
    SELECT Latitude, Longitude INTO v_Lat2, v_Lon2
      FROM `FinalProject`.`DataCenter` WHERE DataCenterID = p_DC2;
    SET v_dLat = RADIANS(v_Lat2 - v_Lat1);
    SET v_dLon = RADIANS(v_Lon2 - v_Lon1);
    SET v_a = SIN(v_dLat/2) * SIN(v_dLat/2)
           + COS(RADIANS(v_Lat1)) * COS(RADIANS(v_Lat2))
           * SIN(v_dLon/2) * SIN(v_dLon/2);
    SET v_c = 2 * ATAN2(SQRT(v_a), SQRT(1 - v_a));
    SET v_D = v_R * v_c;
    RETURN v_D;
END$$
DELIMITER ;

SELECT func_DistanceBetweenDataCenters(1, 2);

-- -----------------------------------------------------
-- PROCEDURES
-- -----------------------------------------------------
-- Update accumulated consumption hourly for yesterday's events.
DELIMITER $$
DROP PROCEDURE IF EXISTS UpdateAccumulatedConsumption$$
CREATE PROCEDURE UpdateAccumulatedConsumption()
BEGIN
    DECLARE v_Yesterday DATE;
    SET v_Yesterday = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    INSERT INTO `FinalProject`.`CumulativeConsumption` (DataCenterID, EventDate, EventTime, AccumulatedConsumption)
    SELECT DataCenterID, EventDate, EventTime, SUM(Consumption)
      FROM `FinalProject`.`DataCenterEvent`
      WHERE EventDate = v_Yesterday
      GROUP BY DataCenterID, EventDate, EventTime;
    DELETE FROM `FinalProject`.`DataCenterEvent`
      WHERE EventDate = v_Yesterday;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- TRIGGERS
-- -----------------------------------------------------
-- After each login, update login statistics by time slot.
DELIMITER $$
DROP TRIGGER IF EXISTS trg_UpdateLoginStats$$
CREATE TRIGGER trg_UpdateLoginStats
AFTER INSERT ON `FinalProject`.`Login`
FOR EACH ROW
BEGIN
    DECLARE v_Hour TIME;
    DECLARE v_Slot VARCHAR(20);
    SET v_Hour = CURTIME();
    IF v_Hour >= '08:00:00' AND v_Hour < '15:00:00' THEN
        SET v_Slot = 'Morning';
    ELSEIF v_Hour >= '15:00:00' AND v_Hour < '22:00:00' THEN
        SET v_Slot = 'Afternoon';
    ELSE
        SET v_Slot = 'Night';
    END IF;
    INSERT INTO `FinalProject`.`EstadisticaLogins` (Fecha, FranjaHoraria, Cantidad, DailyLogID)
      VALUES (CURDATE(), v_Slot, 1, NULL)
    ON DUPLICATE KEY UPDATE Cantidad = Cantidad + 1;
END$$
DELIMITER ;
