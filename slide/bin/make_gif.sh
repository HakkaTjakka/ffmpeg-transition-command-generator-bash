ffmpeg -y -loop 1 -i "3x6qcr.jpg" -t 00:00:01 -c:v libx264 -tune stillimage -pix_fmt yuv420p "3x6qcr.mp4"

ffmpeg -y -i "3x6qcr.mp4" -vf palettegen "3x6qcr.png"

ffmpeg -y -i "3x6qcr.mp4" -i "3x6qcr.png" -filter_complex "[0:v][1:v]paletteuse,fps=25,scale=720:-1" "3x6qcr.gif"
