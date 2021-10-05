from src.utils import *

sql = 'select validation.validation_script()'
conn = connect()
cur = conn.cursor()
cur.execute(sql)
returned_val = cur.fetchone()
ret = int(returned_val[0])
print(ret)
conn.commit()
cur.close()
conn.close()