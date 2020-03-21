

# %%

import re
import subprocess
from pprint import pprint
import pandas as pd
import datetime


def main(daysago=8):

    dt_today = datetime.date.today()
    week_ago = dt_today - datetime.timedelta(days=daysago)

    cmd_list = ["sacct", "-S", f"{week_ago.strftime('%Y-%m-%d')}", "-u", "daeda", "--format=JobID%40,Jobname%40,NCPUS,MaxRSS"] ### "--endtime", "2020-02-21"

    shellout = subprocess.run(cmd_list, capture_output=True)
    # pprint(shellout.stdout.decode())
    # aaa = shellout.stdout.decode()
    # print(aaa)
    
    jobs = re.findall(r'([0-9]{7,10}_[0-9]{1,4}|[0-9]{7,10}) +(\S+)\s+([0-9]{1,2})\s+([0-9]{6,10})', shellout.stdout.decode())
    # re.findall(r'([0-9]{7,10}_[0-9]{1,4}|[0-9]{7,10}) +(\S+)\s+([0-9]{1,2})\s+([0-9]{6,12})K +', shellout.stdout.decode())
    # jobs = re.findall(r'([0-9]{7,10}_[0-9]{1,4}|[0-9]{7,10}) +(\S+)', shellout.stdout.decode())

    print(f"nJobs = {len(jobs)}")

    jobs_stats = list()
    for i_job,job in enumerate(jobs):
        if i_job % 50 == 0:
            print(f"--job {i_job+1}")
        jobid_,jobname,ncpu,maxrss = job

        jobid = jobid_.strip()
        shellout2 = subprocess.run(['seff', jobid], capture_output=True)
        # pprint(shellout2.stdout.decode())

        memut = re.search(r'Memory Utilized\:\s+([0-9]+\.[0-9]+)\s(\S+)\s.*', shellout2.stdout.decode())
        memeff = re.search(r'Memory Efficiency\:\s+([0-9]+\.[0-9]+)%\sof\s([0-9]+\.[0-9]+)\s(\S+)\s.*', shellout2.stdout.decode())

        if memut.group(2) == 'GB':
            jobs_stats.append(
                {
                    'name': jobname,
                    'jobid': jobid,
                    'ncpu': int(ncpu),
                    'MaxRSS': int(maxrss),
                    'MemUtalized': float(memut.group(1)),
                    'MemEff': float(memeff.group(1)),
                    'MemReq': float(memeff.group(2)),
                }
        )

    jobs_stats_df = pd.DataFrame(jobs_stats).sort_values(by=['name','jobid'])

    jobs_stats_over = jobs_stats_df.loc[ jobs_stats_df['MemEff'] < 50, :]

    return jobs_stats_over
    

if __name__ == '__main__':
    jsover = main()
    print(jsover.head())
    print(jsover.shape[0])

    jsover.groupby(['name', 'ncpu', 'MemReq']).mean()

    jsover.groupby(['name', 'ncpu', 'MemReq']).max()



