from src.utils import *


def transfromation_handel():
    try:
        exec_sql_files('files/src/sql/queries/transformed_video_detail.sql')
    except FileNotFoundError as e:
        print('Data Transformation File not Found in Specified Path. !!!')
