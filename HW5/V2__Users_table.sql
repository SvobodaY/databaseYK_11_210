CREATE TABLE Professions (
    Name VARCHAR(255) PRIMARY KEY
);

CREATE TABLE Users (
    ID SERIAL PRIMARY KEY,
    Last_Name VARCHAR(255) NOT NULL,
    First_Name VARCHAR(255) NOT NULL,
    Middle_Name VARCHAR(255),
    Date_of_Birth DATE NOT NULL,
    Profession VARCHAR(255),
    Nationality VARCHAR(255),
    Phone_Number VARCHAR(15) UNIQUE,
    E_mail VARCHAR(255) UNIQUE,
    FOREIGN KEY (Profession) REFERENCES Professions(Name),
    CHECK (Date_of_Birth <= CURRENT_DATE)
);
