import mysql.connector

# Connect to the MySQL database
def connect_to_database():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Manoja@09",
            database="flightaware1db"
        )
        print("Connected to the database successfully!")
        return connection
    except mysql.connector.Error as error:
        print("Error while connecting to the database:", error)

# Query the database and retrieve data
def query_database(connection):
    try:
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM booking LIMIT 10")  # Specifing the correct query
        data = cursor.fetchall()
        return data
    except mysql.connector.Error as error:
        print("Error while querying the database:", error)

# Write data to a text file
def write_to_file(data):
    try:
        with open("database_report.txt", "w") as file:
            for row in data:
                file.write(str(row) + "\n")
        print("Data has been written to database_report.txt successfully!")
    except IOError as error:
        print("Error while writing to file:", error)

# Display data on the screen
def display_data(data):
    for row in data:
        print(row)

def main():
    # Connect to the database
    connection = connect_to_database()

    # Query the database
    data = query_database(connection)

    # Write data to a text file
    write_to_file(data)

    # Display data on the screen
    display_data(data)

    # Close the database connection
    connection.close()

if __name__ == "__main__":
    main()
