from os import error
import psycopg2
import os
from dotenv import load_dotenv
    
def connect():
    try: 
        load_dotenv()
        return psycopg2.connect(host = os.getenv('host'),
        database = os.getenv('database'),
        user = os.getenv('user'),
        password = os.getenv('pass'),
        port = os.getenv('port')
        )
    
    except ConnectionError as e:
        print("Database Connection Error !!!")
        
    except ConnectionRefusedError as e:
        print("Database Connection Refused !!!")
        
    except ConnectionResetError as e:
        print("Database Connection Reset !!!")
    
    except ConnectionAbortedError as e:
        print("Database Connection Aborted !!!")
        
    
def sql_path(path):
    try:
        with open(path, 'r') as create_schema:
            sql = create_schema.readlines()
            sql = ' '.join(sql)
        return sql
    
    except FileNotFoundError as e:
        print("File Not Found in the Location !!!")
        
def exec_sql_files(path):
    try:    
        conn = connect()
        cursor = conn.cursor() 
        execuatable_sql = sql_path(path)
        try:
            cursor.execute(execuatable_sql)
            conn.commit()
            conn.close()
        except RuntimeError as e:
            print("File Execution Error !!!")
    
    except error as e:
        print("Something went wrong !!!") 
