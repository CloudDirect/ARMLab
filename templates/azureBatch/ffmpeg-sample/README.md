# Azure Batch FFMpeg Sample

Download or clone the sample application

    git clone https://github.com/Azure-Samples/batch-python-ffmpeg-tutorial.git

Navigate through to the directory that contains the file `batch_python_tutorial_ffmpeg.py`.

In your Python environment, install the required packages using `pip`.

```bash
pip install -r requirements.txt
```

Open the file `batch_python_tutorial_ffmpeg.py`. Update the Batch and storage account credential strings with the values unique to your accounts. For example:


```Python
_BATCH_ACCOUNT_NAME = 'mybatchaccount'
_BATCH_ACCOUNT_KEY = 'xxxxxxxxxxxxxxxxE+yXrRvJAqT9BlXwwo1CwF+SwAYOxxxxxxxxxxxxxxxx43pXi/gdiATkvbpLRl3x14pcEQ=='
_BATCH_ACCOUNT_URL = 'https://mybatchaccount.mybatchregion.batch.azure.com'
_STORAGE_ACCOUNT_NAME = 'mystorageaccount'
_STORAGE_ACCOUNT_KEY = 'xxxxxxxxxxxxxxxxy4/xxxxxxxxxxxxxxxxfwpbIC5aAWA8wDu+AFXZB827Mt9lybZB1nUcQbQiUrkPtilK5BQ=='
_POOL_ID = 'ffmpeg-pool'
_DEDICATED_POOL_NODE_COUNT = 10
_LOW_PRIORITY_POOL_NODE_COUNT = 10
_POOL_VM_SIZE = 'STANDARD_D1_v2'
_JOB_ID = 'ffmpeg-job'
```

### Run the app

To run the script:

```
python batch_python_tutorial_ffmpeg.py
```

When you run the sample application, the console output is similar to the following. During execution, you experience a pause at `Monitoring all tasks for 'Completed' state, timeout in 00:30:00...` while the pool's compute nodes are started. 
   
```
Sample start: 12/12/2017 3:20:21 PM

Container [input] created.
Container [output] created.
Uploading file LowPriVMs-1.mp4 to container [input]...
Uploading file LowPriVMs-2.mp4 to container [input]...
Uploading file LowPriVMs-3.mp4 to container [input]...
Uploading file LowPriVMs-4.mp4 to container [input]...
Uploading file LowPriVMs-5.mp4 to container [input]...
Creating pool [LinuxFFmpegPool]...
Creating job [LinuxFFmpegJob]...
Adding 5 tasks to job [LinuxFFmpegJob]...
Monitoring all tasks for 'Completed' state, timeout in 00:30:00...
Success! All tasks completed successfully within the specified timeout period.
Deleting container [input]....

Sample end: 12/12/2017 3:29:36 PM
Elapsed time: 00:09:14.3418742
```

Go to your Batch account in the Azure portal to monitor the pool, compute nodes, job, and tasks. For example, to see a heat map of the compute nodes in your pool, click **Pools** > *ffmpeg-pool*.

