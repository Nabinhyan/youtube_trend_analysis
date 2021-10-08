import ntpath
from src.utils import *


def read_csv(single_path):
    head, tail = ntpath.split(single_path)
    # Extraction of country code from file_name #
    country_code = ntpath.basename(tail)[:2]
    conn = connect()
    cursor = conn.cursor()
    create_raw_table = f'''CALL raw_data.raw_video_detail('{single_path}', '{country_code}')'''
    cursor.execute(create_raw_table)
    conn.commit()
    cursor.close()
    conn.close()
