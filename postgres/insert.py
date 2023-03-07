import os
from glob import glob
import psycopg2
import psycopg2.extras as extras
import pandas as pd
import sys


param_dic = {
    "host"      : "172.17.0.2",
    "database"  : "test",
    "user"      : "postgres",
    "password"  : "password"
}


def connect(params_dic):
    """ Connect to the PostgreSQL database server """
    conn = None
    try:
        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params_dic)
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
        sys.exit(1) 
    print("Connection successful")
    return conn


def allCSVs():
    PATH = "/media/ssd/bitmex/data/trade"
    EXT = "*.csv"
    all_csv_files = []
    for path, subdir, files in os.walk(PATH):
        for file in glob(os.path.join(path, EXT)):
            all_csv_files.append(file)

    return(all_csv_files)


def execute_values(conn, df, table):
    """
    Using psycopg2.extras.execute_values() to insert the dataframe
    """
    # Create a list of tupples from the dataframe values
    tuples = [tuple(x) for x in df.to_numpy()]
    # Comma-separated dataframe columns
    cols = ','.join(list(df.columns))
    # SQL quert to execute
    query  = "INSERT INTO %s(%s) VALUES %%s" % (table, cols)
    cursor = conn.cursor()
    try:
        extras.execute_values(cursor, query, tuples)
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print("Error: %s" % error)
        conn.rollback()
        cursor.close()
        return 1
    print("execute_values() done")
    cursor.close()


def main():
    conn = connect(param_dic)

    all_csv_files = allCSVs()
    for file in all_csv_files:
        print(file)
        try:
            df = pd.read_csv(file, dtype=str)
            df['timestamp'] = pd.to_datetime(df.timestamp, format='%Y-%m-%dD%H:%M:%S.%f').astype('object')
        except (Exception) as error:
            print("Error: %s" % error)
            continue

        execute_values(conn, df, 'trade')


main()
