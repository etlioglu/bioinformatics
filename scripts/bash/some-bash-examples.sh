# disk usage stats

cat <(df -h; echo) <(du -sh /home/* | sort -hr) | mail -s "Disk usage checks for /dev/sdb4 and /dev/sda1" email@email.blabla