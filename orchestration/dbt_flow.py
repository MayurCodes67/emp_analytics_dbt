from prefect import flow, task
import subprocess

PROJECT_DIR = r'C:\emp_analytics\WoW_Model'

@task(name = 'run dbt run')
def dbt_run():
    subprocess.run(
        ['dbt', 'run'],
        cwd = PROJECT_DIR,
        check = True
    )

@task(name = 'run dbt test')
def dbt_test():
    subprocess.run(
        ['dbt', 'test'],
        cwd = PROJECT_DIR,
        check = True
    )

if __name__ == '__main__':
    def dbt_pipeline():
        dbt_run()
        dbt_test()

