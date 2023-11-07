# find the top ten unique words in a file
# tr " " "\n" -> places each word in a new line
# uniq should be used in combination with sort as it compares adjacent lines

cat text-file.txt | tr " " "\n" | sort | uniq -c | sort -gr | head -10