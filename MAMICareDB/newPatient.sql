DELIMITER //
CREATE PROCEDURE newPatient 
(IN newFirstName VARCHAR(255), IN newLastName1 VARCHAR(255), IN newLastName2 VARCHAR(255), IN newBirthDate DATE, IN newEmail VARCHAR(255), IN newCurp VARCHAR(18))
BEGIN
	INSERT INTO Patient (firstName, lastName1, lastName2, birthDate, email, curp)
	VALUES (newFirstName, newLastName1, newLastName2, newBirthDate, newEmail, newCurp);
END //
DELIMITER;