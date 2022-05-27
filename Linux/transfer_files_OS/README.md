# transfer files between Windows and Linux
scp -r \Users\Desktop\folder root@xxx.xxx.xx.xx:~/folder

# transfer files between Linux/MacOS and Linux
rsync -a --progress \Users\Desktop\folder root@xxx.xxx.xx.xx:~/folder
## Note: exlcude files to be transferred:
--exclude '.git' --exclude '.venv/' 