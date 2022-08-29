bin2/ffmpeg \
-i "russel.01.mp4" \
-i "russel.02.mp4" \
-i "russel.03.mp4" \
-filter_complex " \
[0:v]split[v0a0][v0b0]; \
[0:a]atrim=0:76.52[s0]; \
[v0a0]trim=0:74.52[v0a1]; \
[v0b0]trim=74.52:76.52[v0b1t]; \
[v0b1t]setpts=PTS-STARTPTS[v0b1]; \

[1:v]split[v1a0][v1b0]; \
[1:a]atrim=0:18.52[s1]; \
[v1a0]trim=0:16.52[v1a1]; \
[v1b0]trim=16.52:18.52[v1b1t]; \
[v1b1t]setpts=PTS-STARTPTS[v1b1]; \

[v0b1][v1a1]gltransition=duration=2.0:source=transitions/crosswarp.glsl[vt0]; \
[s0][s1]acrossfade=duration=2.0[outa1]; \

[2:v]split[v2a0][v2b0]; \
[2:a]atrim=0:13.52[s2]; \
[v2a0]trim=0:11.52[v2a1]; \
[v2b0]trim=11.52:13.52[v2b1t]; \
[v2b1t]setpts=PTS-STARTPTS[v2b1]; \

[v1b1][v2a1]gltransition=duration=2.0:source=transitions/crosswarp.glsl[vt1]; \
[outa1][s2]acrossfade=duration=2.0[outa]; \

[v0a1][vt0][vt1][v2b1]concat=n=4[outv] \

" \
-map "[outv]" \
-map "[outa]" \
-c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart \
-y output_transition.mp4
