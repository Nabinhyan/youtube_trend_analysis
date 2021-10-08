import ntpath
import re
import os
from src.utils import exec_sql_files, sql_path, connect


def validation_script_exec(validation_script):
    scripts = sql_path(validation_script)
    scripts = re.split(r'[;]', scripts)
    for each_sql in scripts:
        if each_sql.strip('\n'):
            sql = f'''SELECT validation_script('{each_sql}')'''
            conn = connect()
            cur = conn.cursor()
            cur.execute(sql)
            returned_val = cur.fetchone()
            ret = int(returned_val[0])
            if ret == 0:
                continue
            elif ret != 0:
                head, tail = ntpath.split(validation_script)
                # Extraction of country code from file_name #
                file_name = ntpath.basename(tail)
                print(f'validation_interupted at script {file_name}')
                break
            conn.commit()
            cur.close()
            conn.close()
    return ret


def validation_script(base_path):
    try:
        exec_sql_files('files/src/sql/function/validation.sql')
        for path in os.listdir(base_path):
            full_path = os.path.join(base_path, path)
            if os.path.isfile(full_path):
                if full_path.endswith('.sql'):
                    try:
                        error_count = validation_script_exec(full_path)
                    except RuntimeError as e:
                        print('Error while Execution !')
                    except Exception as e:
                        print(e)
    except NotADirectoryError as e:
        print("Directory path error...")
    except Exception as e:
        print(e)
    return error_count
