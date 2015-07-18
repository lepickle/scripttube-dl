#!/bin/bash
url=''

get480p()
{
	echo "Selecting 480p"
	sudo youtube-dl --verbose --write-sub --sub-format srt --add-metadata --retries infinite -f 'best[height<=480]' -c -o '~/Downloads/%(title)s_[%(id)s_%(format)s_%(uploader)s_%(uploader_id)s_%(upload_date)s].%(ext)s' $url
}

get720p()
{
	echo "Selecting 720p"
	sudo youtube-dl --verbose --write-sub --sub-format srt --add-metadata --retries infinite -f best -c -o '~/Downloads/%(title)s_[%(id)s_%(format)s_%(uploader)s_%(uploader_id)s_%(upload_date)s].%(ext)s' $url
}

getAudioOnly()
{
	echo "Selecting Audio only"
	sudo youtube-dl --verbose --retries 20 -f bestaudio -c -o '~/Downloads/%(title)s_[%(id)s_%(format)s_%(uploader)s_%(uploader_id)s_%(upload_date)s].%(ext)s' $url
}

printf "Enter url\n"
read url
printf "Quality \n 1: 480p \n 2: 720p \n 3: Audio Only\n"
read chc
if [ $chc -eq 1 ]
        then get480p;
elif [ $chc -eq 2 ]
        then get720p;
elif [ $chc -eq 3 ]
	then getAudioOnly;
else 
        echo "Unknown command"
fi
printf "Press enter to exit"
read end