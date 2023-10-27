from mimesis import Generic
import psycopg2


faker = Generic()
db_params = {
    'dbname': 'userdb',
    'user': 'postgres',
    'password': 'temur20041',
    'host': 'localhost',
    'port': '5432'
}

try:
    conn = psycopg2.connect(**db_params)

    cursor = conn.cursor()

    for _ in range(1000):
        last_name = faker.person.last_name()
        first_name = faker.person.first_name()
        middle_name = faker.person.surname()
        birth_date = faker.datetime.date(start=1980, end=2000)
        profession = "Stockman"
        nationality = faker.person.nationality()
        phone_number = faker.person.telephone()
        email = faker.person.email()

        insert_profession_query = "INSERT INTO Professions (Name) VALUES (%s) ON CONFLICT (Name) DO NOTHING"
        profession_data = (profession,)
        cursor.execute(insert_profession_query, profession_data)

        insert_query = "INSERT INTO Users (Last_Name, First_Name, Middle_Name, Date_Of_Birth, Profession, Nationality, Phone_Number, E_mail) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
        data = (last_name, first_name, middle_name, birth_date, profession, nationality, phone_number, email)
        cursor.execute(insert_query, data)

    conn.commit()

    cursor.close()
    conn.close()

except Exception as e:
    print(f"Ошибка при подключении к базе данных: {e}")
