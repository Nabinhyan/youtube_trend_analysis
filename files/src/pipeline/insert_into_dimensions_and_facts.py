import os
from src.utils import exec_sql_files


def ins_to_dim_facts():
    base_path = ['files/src/sql/queries/insert_dim/',
                 'files/src/sql/queries/insert_facts/']
    for each_base_path in base_path:
        try:
            for path in os.listdir(each_base_path):
                full_path = os.path.join(each_base_path, path)
                if os.path.isfile(full_path):
                    if full_path.endswith('.sql'):
                        try:
                            exec_sql_files(full_path)
                        except RuntimeError as e:
                            print('Error while creating tables !')
                        except FileExistsError as e:
                            print('Table Already Exists !!!')
                        except Exception as e:
                            print(e)
        except NotADirectoryError as e:
            print("Directory path error...")
