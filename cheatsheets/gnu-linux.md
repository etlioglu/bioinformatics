# GNU/Linux

## General

- `$0` is a special variable and can be used in two ways. i) If run in the terminal, returns the logged in shell. ii) If run in a script, returns the name of the script.

- Deleting BAM files recursively:

        find . -name "*.bam" -type f -delete

- Deleting folders recursively

        find . -name "work" -type d -exec rm -rf {} +

- Disk usage

        du -sh ./*/ | sort -hr

- Checking the processes per user

        ps -u username
        top -u username

- Reading urls from a text file and downloading data

        while read p; do wget $p; done < urls.txt

- Free up space on CentOS (try with sudo as well)

        yum clean all

- Untarring a file:

        tar -xvf file_name.tar

- Converting png files to pdf:

        convert file.png file.pdf

- Merging pdf files:

        pdfunite file1.pdf file2.pdf united.pdf

- Getting unique values in column 1

        awk -F '\t' '{print $1}' 2014_173.txt | sort | uniq -d | wc

- Creating a symlink so that a script that is installed via pip3 can be called from anywhere: (first path is the one of the script and the second one where the symlink is placed, -s means "symbolic" so no hard link is created):

        sudo ln -s ~/.local/bin/multiqc /usr/local/bin/multiqc

- Redirecting `stderr` to `stdout` so that both can be collected within the same file.

        some_command > out.txt > 2>&1

## Crontab

- list jobs

        crontab -l

- edit jobs

        # use with sudo for scripts requring root privilages
        crontab -e

- [crontab guru](https://crontab.guru/) helps with cron schedule expressions

- `sudo crontab -e` for scripts requireing `sudo`

## md5sum

- Generate a checksum file

        md5sum * > MD5-checksum-file

- Compare MD5 checksums when a checksum file is present:

        md5sum -c MD5-checksum-file

## Bioinformatics

- counting reads in a compressed fastq file

        zcat my_fastq.gz | echo $((“wc -l"/4))

## ftp

### Uploading data to Array Express (AE)

- Generate `md5sum` hashes for the files to be uploaded

- `cd` into where the files are and connect to the server from that directory

        ftp -p ftp-private-2.ebi.ac.uk


- After entering the username and password, cd into the directory AE assigns for the project
  ─╯
  ftp> cd lwp0xuk9-2iv16yjkidt7g/

- The following is required to turn off the `interactive` mode, no need to confirm each transfer

        ftp> prompt

- Transfer files with the `muput` command

        ftp> mput *.fq.gz

## Managing users

- Listing users:

        cat /etc/passwd
        awk -F: '{ print $1}' /etc/passwd

- Deleting a user:

        sudo userdel sammy

- Deleting a user as well as their home directory:

        sudo userdel -r sammy

- Change user

        # `-l` means login
        su –l <other_user_name>
