INSERT IGNORE INTO Patient(firstName, lastName1, lastName2, birthDate, email, curp, isActive)
VALUES('Paulina', 'Escalante', 'Campbell', '1994-04-05', 'pauescalante8@hotmail.com','EACP940504MNLSML', true);

INSERT IGNORE INTO Patient(firstName, lastName1, lastName2, birthDate, email, curp, isActive)
VALUES ('Isabela', 'Escalante', 'Campbell', '1996-09-01', 'isaescalante8@hotmail.com','EACI960109MNLSML', true);

INSERT IGNORE INTO SocialWorker(username, password, firstName, lastName)
VALUES('luislamat', 'thisisluis', 'Luis', 'Lamadrid');

INSERT IGNORE INTO SocialWorker(username, password, firstName, lastName)
VALUES ('thisisnaty', 'tomsawyer', 'Natalia', 'Garcia');

SELECT * FROM Patient;
SELECT * FROM SocialWorker;
