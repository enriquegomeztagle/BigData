# pip install pymysql
import pymysql

def get_db_connection():
    return pymysql.connect(
        host='localhost',
        user='root',
        password='',
        database='F1-EDA-Project',
        cursorclass=pymysql.cursors.DictCursor
    )

def count_rows_and_columns(db_connection):
    try:
        with db_connection.cursor() as cursor:
            # Ensure that the database name is correctly passed to the SQL query
            database_name = db_connection.db.decode('utf-8')
            query = "SELECT TABLE_NAME AS 'TABLE_NAME' FROM information_schema.tables WHERE table_schema = %s AND table_type = 'BASE TABLE'"
            cursor.execute(query, (database_name,))
            tables = cursor.fetchall()

            # Check if tables are fetched correctly
            if not tables:
                print(f"No tables found in the database {database_name}.")
                return

            # Iterate over each table and count rows and columns
            for table in tables:
                table_name = table['TABLE_NAME']  # Use the correct key here

                # Count columns
                cursor.execute("SELECT COUNT(*) AS column_count FROM information_schema.columns WHERE table_schema = %s AND TABLE_NAME = %s", (database_name, table_name))
                column_count = cursor.fetchone()['column_count']
                
                # Count rows
                cursor.execute(f"SELECT COUNT(*) AS row_count FROM `{table_name}`")
                row_count = cursor.fetchone()['row_count']
                
                # Print the results
                print(f"Table: {table_name}, Columns: {column_count}, Rows: {row_count}")
    
    except Exception as e:
        print(f"An error occurred: {e}")

def main():
    db_connection = get_db_connection()
    try:
        count_rows_and_columns(db_connection)
    finally:
        db_connection.close()

if __name__ == '__main__':
    main()
