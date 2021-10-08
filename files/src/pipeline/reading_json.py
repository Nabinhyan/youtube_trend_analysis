from src.utils import *
import pandas as pd
from sqlalchemy import create_engine, engine


def read_json(single_path):
    kind, etag, category_id, assignable, category, channel_id = [], [], [], [], [], []
    data = pd.read_json(single_path)
    # extracting kind, etag, channelID, assignable, category and id from entire individual json file
    for item in data['items']:
        kind.append(item['kind'])
        etag.append(item['etag'])
        category_id.append(int(item["id"]))
        channel_id.append(item['snippet']['channelId'])
        category.append(item['snippet']['title'])
        assignable.append(item['snippet']['assignable'])

    new_data = pd.DataFrame({'kind': kind,
                             'etag': etag,
                             'category_id': category_id,
                             'channel_id': channel_id,
                             'category': category,
                             'assignable': assignable
                             })
    engine = create_engine('postgresql://postgres: @localhost: 5432/youtube')
    new_data.to_sql('raw_category', engine)
    engine.dispose()

    exec_sql_files('files/src/sql/queries/raw_archive_category.sql')
