import os
import sys
import time

try:
    from src.utils import *
    from src.pipeline.reading_csv import *
    from src.pipeline.reading_json import *
    from src.pipeline.validate import *
    from src.pipeline.create_tables import create_table
    from src.pipeline.transformation import transfromation_handel
    from src.pipeline.insert_into_dimensions_and_facts import ins_to_dim_facts

except ModuleNotFoundError as e:
    print("Module Not Found !!!")


def raw_handel():
    exec_sql_files('files/src/sql/procedure/copy_raw_to_archive.sql')
    # Reading the absolute path of the data #
    abs_path = [os.path.join(r, file) for r, d, f in os.walk(
        "D:/leapfrog/final_project/files/data/") for file in f]
    for single_path in abs_path:
        if single_path.endswith('.csv') == True:
            try:
                read_csv(single_path)
            except NameError as e:
                print('Function Call Name Error !')

        if single_path.endswith('.json') == True:
            try:
                read_json(single_path)
            except NameError as e:
                print('Function Call Name Error !')


def main():
    try:
        total_time = time.time()
        
        creating_table_time = time.time()
        print("Creating Table")
        create_table()
        create_table_stop = time.time()
        time_taken = create_table_stop - creating_table_time
        print(f"Time taken to create = {time_taken}")
        
        reading_data_start = time.time()
        print("Reading files from directory.")
        raw_handel()
        reading_data_stop = time.time()
        time_taken = reading_data_stop - reading_data_start
        print(f"Time taken to read data from files = {time_taken}")
        
        # this chunk of code validate the archive table
        archive_validate_start = time.time()
        print("Validating Archive Table")
        archive_validation_base_path = 'files/src/sql/queries/validation/raw_archive_validation/'
        error_count = validation_script(archive_validation_base_path)
        archive_validation_stop = time.time()
        time_taken = archive_validation_stop - archive_validate_start
        print(f"Archive validation time = {time_taken}")
        if error_count != 0:
            sys.exit(
                'Validation Error Caused in Archive file. Please visit through validation error.')

        else:
            print('Transformation Process')
            transformation_start = time.time()
            transfromation_handel()
            transfromation_stop = time.time()
            time_taken = transfromation_stop - transformation_start
            print(f"Transformation duration = {time_taken}")

        # this chunk of code validate the transformation table
        validate_transformation_start = time.time()
        print("Validating Transformation")
        transformation_validation_base_path = 'files/src/sql/queries/validation/transformation_validation/'
        error_count = validation_script(transformation_validation_base_path)
        validate_transformation_stop = time.time()
        time_taken = validate_transformation_stop - validate_transformation_start
        print(f"Transfromation Validation duration = {time_taken}")
        if error_count != 0:
            sys.exit(
                'Validation Error Caused in Transformation. Please visit through validation error.')

        else:
            print("Inserting data to dimensions and fact table")
            dim_fact_start = time.time()
            ins_to_dim_facts()
            dim_fact_stop = time.time()
            time_taken = dim_fact_stop - dim_fact_start
            print(f"Time taken to insert into dimension and fact table = {time_taken}")

        # this chunk of code validate the dimension table
        validate_dim_start = time.time()
        print('Validating Dimensions')
        dimension_validation_base_path = 'files/src/sql/queries/validation/dimension_validation/'
        error_count = validation_script(dimension_validation_base_path)
        validate_dim_stop = time.time()
        time_taken = validate_dim_stop - validate_dim_start
        print(f"Dimension Validation duration = {time_taken}")
        if error_count != 0:
            sys.exit(
                'Validation Error Caused in Dimension. Please visit through validation error.')

        final_time = time.time()
        time_taken = final_time - total_time
        print(f"Time taken to execute the enitre code = {time_taken}")
        print("Execution Completed")

    except FileNotFoundError as e:
        print('File not found to create schemas !')

    except NameError as e:
        print('Function Name Error')

    except RuntimeError as e:
        print('Error in execution !!!')

    except Exception as e:
        print(e)

    finally:
        print("Program at the End Point ! \n Happy Programming")


if __name__ == '__main__':
    try:
        main()

    except NameError:
        print('Function Name Error !!!')
