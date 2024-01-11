
# Bash Script to clean out all the .wav  audios data in /data/audios/folder.

Write a bash script to clean out all the .wav  audios data in /data/audios/folder that are older than 40hrs by default (If no argrument passed) and if you pass first arguments to script with relative time like 1hrs or 100hrs then script should clean out audio data. Also generate a log file with the namedeleted-files-<date>-<month>-<year>.log which should contain:

name of audio file
time of creation of audio file (ISO Format)
time of deletion of audio file (ISO Format)
For example:

A sample script should like sh managing-disk-space.sh 10hrs

A sample log file deleted-files-12-02-2020.log will contain:

...
audio_0010023.wav 10-02-2020T08:37:16+05:30 12-02-2020T10:18:40+05:30
audio_0010024.wav 10-02-2020T08:38:16+05:30 12-02-2020T10:18:42+05:30
audio_0010025.wav 10-02-2020T08:38:50+05:30 12-02-2020T10:18:45+05:30
...
## Command to Run the script
Save the script in a file named managedisk.sh.

to make the script executable:

```bash
  chmod +x managedisk.sh
```
Run the script use command:

```bash
  ./managedisk.sh
```
Check the generated log file for details:

```bash
cat deleted-files-10-01-2024.log
```