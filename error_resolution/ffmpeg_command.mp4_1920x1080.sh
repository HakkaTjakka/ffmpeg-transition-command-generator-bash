bin/ffmpeg \
-i "mp4_1920x1080/out.01.mp4" \
-i "mp4_1920x1080/out.02.mp4" \
-i "mp4_1920x1080/out.03.mp4" \
-i "mp4_1920x1080/out.04.mp4" \
-i "mp4_1920x1080/out.05.mp4" \
-filter_complex " \
[0:v]split[v0a][v0b]; \
[v0a]trim=0.0:7.00[v0A]; \
[v0b]trim=7.00:12.00,setpts=PTS-STARTPTS[v0B]; \
[v0B]pipglshader=start=0.0:duration=5.0:pip_duration=5.0:ext_source=mp4_1920x1080/out.02.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out0]; \

[1:v]split[v1a][v1b]; \
[v1a]trim=5.0:7.00,setpts=PTS-STARTPTS[v1A]; \
[v1b]trim=7.00:12.00,setpts=PTS-STARTPTS[v1B]; \
[v1B]pipglshader=start=0.0:duration=5.0:pip_duration=5.0:ext_source=mp4_1920x1080/out.03.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out1]; \

[2:v]split[v2a][v2b]; \
[v2a]trim=5.0:7.00,setpts=PTS-STARTPTS[v2A]; \
[v2b]trim=7.00:12.00,setpts=PTS-STARTPTS[v2B]; \
[v2B]pipglshader=start=0.0:duration=5.0:pip_duration=5.0:ext_source=mp4_1920x1080/out.04.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out2]; \

[3:v]split[v3a][v3b]; \
[v3a]trim=5.0:7.00,setpts=PTS-STARTPTS[v3A]; \
[v3b]trim=7.00:12.00,setpts=PTS-STARTPTS[v3B]; \
[v3B]pipglshader=start=0.0:duration=5.0:pip_duration=5.0:ext_source=mp4_1920x1080/out.05.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out3]; \

[4:v]trim=7.00:12.00,setpts=PTS-STARTPTS[v4B]; \
[v0A][out0][v1A][out1][v2A][out2][v3A][out3][v4B]concat=n=9[outv] \
" \
-map "[outv]" \
-an \
-c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart -vsync 2 \
-y output_mp4_1920x1080.mp4
