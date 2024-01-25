#!/bin/bash
# Este script reduce y concatena 4 videos

# tags: ffmpeg, reduce, concatenate

# reemplazar <video*>
ffmpeg -y  \
	-i <video1> \
	-i <video2> \
	-i <video3> \
	-i <video4> \
	-r 24 \
	-map_metadata -1 \
	-fflags +bitexact -flags:v +bitexact -flags:a +bitexact \
	-filter_complex \
		"[0:v]scale=720:400:[v0];\
		[1:v]scale=720:400:[v1];\
		[2:v]scale=720:400:[v2];\
		[3:v]scale=720:400:[v3];\
		[v0][0:a][v1][1:a][v2][2:a][v3][3:a]concat=n=4:v=1:a=1[v][a]" \
	  -map [v] -map [a]  /tmp/output.mp4


# https://stackoverflow.com/questions/19425674/ffmpeg-concat-and-scale-simultaneously/48853654#48853654
# https://stackoverflow.com/questions/37327163/ffmpeg-input-link-in1v0-parameters-size-640x640-sar-169-do-not-match-the?noredirect=1&lq=1
# https://superuser.com/questions/1136822/how-to-concatenate-two-or-more-videos-with-different-dimensions-in-ffmpeg
# https://superuser.com/questions/441361/strip-metadata-from-all-formats-with-ffmpeg
# https://unix.stackexchange.com/questions/28803/how-can-i-reduce-a-videos-size-with-ffmpeg
