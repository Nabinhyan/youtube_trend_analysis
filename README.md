<h1><p style="text-align:center"> Folder Structure for the project</p></h1>

The folder structure for this project has been maintained as mention below:
<ul>
    <li>data --> this folder contains all the csv and json data files</li>
    <li>document --> this folder contains the document file in markdown format and image folder which contains the images for the document.</li>
    <ul>
    <li>query_op --> This folder contains the images of output after inserting the data to the tables.</li>
    <li>visualization --> This folder contains the sub-folder containing the visualization images based on dashboard</li>
        <ul>
            <li>category --> This folder contains the images for the category dashboard</li>
            <li>channel --> This folder contains the images for the channel dashboard</li>
            <li>country --> This folder contains the images for the country dashboard</li>
        </ul>
    </ul>
<li>schema --> This folder contains the subfolder that include script to creates the schema and table</li>
    <ul>
    <li>csv_file_handel --> This folder contains the scripts to create the raw tables and archive table.</li>
    <li>dimension_handeling --> This folder contains the scripts to create the dimension tables.</li>
    <li>facts --> This folder contains the script to create the central fact table.</li>
    <li>json_file_handeling --> This folder contains the script to create the archive table to handle json data</li>
    <li>transformation_handle --> This folder contains the script to create the transformation table.</li>
    </ul>
<li>src --> This folder contains the following sub-folders:</li>
    <ul>
    <li>pipeline --> This folder contains the pipline scripts for ETL written in python programming language.</li>
    <li>sql --> This sub-folder contains further sub-folder as below:</li>
        <ul>
            <li>function --> This folder contains the script to create the validation function.</li>   
            <li>procedure --> This folder contains the script to crete the stored procedure to copy raw data from csv and inserting it to archive table.</li>
            <li>queries --> This folder contains the following subfolders:</li>
            <ul>
                <li>insert_dim --> This folder contains the query to insert the data from transformation table to dimension tables.</li>
                <li>insert_facts --> This folder contains the query files to insert the data from dimensions and transfromed tables to central fact table.</li>
                <li>validation --> This folder contains following sub-folders:</li>
                <ul>
                    <li>dimension_validation --> This folder contains the validation script to validate the dimension tables.</li>
                    <li>raw_archive_validation --> This folder contains the validation script to the raw_archive tables.</li>
                    <li>transfromation_validation --> This folder contains the validation scripts to validata the transformation table.</li>
                </ul>
            </ul>
        </ul>
    </ul>
<li>The utils.py files contains the database connection function to connect with database, sql_path function to extract the sql queries from the .sql files, and exec_sql_files to execute the queries inside the .sql files.</li>
</ul>
Also, you need to create .env file inside the src folder containing the connection credential to your database as mentioned below:

```
host = 'host_name'
user = 'db_user_name'
pass = 'db_login_password'
port = 'db_running_port'
database = 'db_name'
```
Finally, you can run the 'main.py' file inside the `src/pipeline` folder as `python main.py` to start the ETL process.

