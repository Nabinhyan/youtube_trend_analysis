import os
import sys
import time

try:
    from src.utils import *
    from src.pipeline.reading_csv import *
    from src.pipeline.reading_json import *
    from src.pipeline.validation import validation
    from src.pipeline.create_tables import create_table
    from src.pipeline.transformation import transfromation_handel
    from src.pipeline.insert_into_dimensions_and_facts import ins_to_dim_facts
    
except ModuleNotFoundError as e:
    print("Module Not Found !!!")

def raw_handel():
    exec_sql_files('files/src/sql/procedure/copy_raw_to_archive.sql')
    # Reading the absolute path of the data #
    abs_path = [os.path.join(r, file) for r, d, f in os.walk("D:/leapfrog/final_project/files/data/") for file in f]
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
        initial_time = time.time()
        create_table()
        raw_handel()
        transfromation_handel()
        transformation_validation_base_path = 'files/src/sql/queries/validation/transformation_validation/'
        error_count = validation(transformation_validation_base_path)
        if error_count != 0:
            sys.exit('Validation Error Caused in Transformation. Please visit through validation error.')
        else:
            ins_to_dim_facts()
            dimension_validation_base_path = 'files/src/sql/queries/validation/dimension_validation/'
            error_count = validation(dimension_validation_base_path)
            if error_count != 0:
                sys.exit('Validation Error Caused in Dimension. Please visit through validation error.')                
        final_time = time.time()
        time_taken = final_time - initial_time
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
