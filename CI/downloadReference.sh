#! /bin/sh
echo Connecting to the FTP server
# Start of "here" document
ftp -n 130.237.53.244 <<**
user anonymous tin
lcd CI
mget ./
bye
**
# End of "here" document
echo Data is downloaded.