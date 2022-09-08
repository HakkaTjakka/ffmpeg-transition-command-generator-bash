


ffmpeg -y -loop 1 -i "$1.jpg" -t 00:00:01 -vf pad="width=ceil(iw/2)*2:height=ceil(ih/2)*2" -c:v libx264 -tune stillimage -pix_fmt yuv420p "$1.mp4"

ffmpeg -y -i "$1.mp4" -vf palettegen "$1.png"

ffmpeg -y -i "$1.mp4" -i "$1.png" -filter_complex "[0:v][1:v]paletteuse" "$1.gif"
# ffmpeg -y -i "$1.mp4" -i "$1.png" -filter_complex "[0:v][1:v]paletteuse,scale=720:-1" "$1.gif"

