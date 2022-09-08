bin/ffmpeg_g \
-i "movie/simple.01.mp4" \
-i "movie/simple.02.mp4" \
-i "movie/simple.03.mp4" \
-i "movie/simple.04.mp4" \
-i "movie/simple.05.mp4" \
-i "movie/simple.06.mp4" \
-i "movie/simple.07.mp4" \
-i "movie/simple.08.mp4" \
-i "movie/simple.09.mp4" \
-i "movie/simple.10.mp4" \
-i "movie/simple.11.mp4" \
-i "movie/simple.12.mp4" \
-i "movie/simple.13.mp4" \
-i "movie/simple.14.mp4" \
-i "movie/simple.15.mp4" \
-i "movie/simple.16.mp4" \
-i "movie/simple.17.mp4" \
-i "movie/simple.18.mp4" \
-i "movie/simple.19.mp4" \
-i "movie/simple.20.mp4" \
-i "movie/simple.21.mp4" \
-i "movie/simple.22.mp4" \
-i "movie/simple.23.mp4" \
-i "movie/simple.24.mp4" \
-i "movie/simple.25.mp4" \
-filter_complex " \
[0:v]trim=0.0:2.00,setpts=PTS-STARTPTS[v0B]; \
[v0B]pipglshader=start=0.0:duration=2.00:pip_duration=2.00:ext_source=movie/simple.01.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out0]; \

[1:v]trim=0.0:6.00,setpts=PTS-STARTPTS[v1B]; \
[v1B]pipglshader=start=0.0:duration=6.00:pip_duration=6.00:ext_source=movie/simple.02.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out1]; \

[2:v]trim=0.0:9.00,setpts=PTS-STARTPTS[v2B]; \
[v2B]pipglshader=start=0.0:duration=9.00:pip_duration=9.00:ext_source=movie/simple.03.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out2]; \

[3:v]trim=0.0:10.00,setpts=PTS-STARTPTS[v3B]; \
[v3B]pipglshader=start=0.0:duration=10.00:pip_duration=10.00:ext_source=movie/simple.04.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out3]; \

[4:v]trim=0.0:6.00,setpts=PTS-STARTPTS[v4B]; \
[v4B]pipglshader=start=0.0:duration=6.00:pip_duration=6.00:ext_source=movie/simple.05.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out4]; \

[5:v]trim=0.0:4.00,setpts=PTS-STARTPTS[v5B]; \
[v5B]pipglshader=start=0.0:duration=4.00:pip_duration=4.00:ext_source=movie/simple.06.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out5]; \

[6:v]trim=0.0:5.50,setpts=PTS-STARTPTS[v6B]; \
[v6B]pipglshader=start=0.0:duration=5.50:pip_duration=5.50:ext_source=movie/simple.07.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out6]; \

[7:v]trim=0.0:5.00,setpts=PTS-STARTPTS[v7B]; \
[v7B]pipglshader=start=0.0:duration=5.00:pip_duration=5.00:ext_source=movie/simple.08.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out7]; \

[8:v]trim=0.0:6.00,setpts=PTS-STARTPTS[v8B]; \
[v8B]pipglshader=start=0.0:duration=6.00:pip_duration=6.00:ext_source=movie/simple.09.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out8]; \

[9:v]trim=0.0:4.50,setpts=PTS-STARTPTS[v9B]; \
[v9B]pipglshader=start=0.0:duration=4.50:pip_duration=4.50:ext_source=movie/simple.10.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out9]; \

[10:v]trim=0.0:4.00,setpts=PTS-STARTPTS[v10B]; \
[v10B]pipglshader=start=0.0:duration=4.00:pip_duration=4.00:ext_source=movie/simple.11.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out10]; \

[11:v]trim=0.0:6.00,setpts=PTS-STARTPTS[v11B]; \
[v11B]pipglshader=start=0.0:duration=6.00:pip_duration=6.00:ext_source=movie/simple.12.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out11]; \

[12:v]trim=0.0:5.50,setpts=PTS-STARTPTS[v12B]; \
[v12B]pipglshader=start=0.0:duration=5.50:pip_duration=5.50:ext_source=movie/simple.13.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out12]; \

[13:v]trim=0.0:54.50,setpts=PTS-STARTPTS[v13B]; \
[v13B]pipglshader=start=0.0:duration=54.50:pip_duration=54.50:ext_source=movie/simple.14.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out13]; \

[14:v]trim=0.0:13.00,setpts=PTS-STARTPTS[v14B]; \
[v14B]pipglshader=start=0.0:duration=13.00:pip_duration=13.00:ext_source=movie/simple.15.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out14]; \

[15:v]trim=0.0:8.00,setpts=PTS-STARTPTS[v15B]; \
[v15B]pipglshader=start=0.0:duration=8.00:pip_duration=8.00:ext_source=movie/simple.16.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out15]; \

[16:v]trim=0.0:5.00,setpts=PTS-STARTPTS[v16B]; \
[v16B]pipglshader=start=0.0:duration=5.00:pip_duration=5.00:ext_source=movie/simple.17.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out16]; \

[17:v]trim=0.0:5.00,setpts=PTS-STARTPTS[v17B]; \
[v17B]pipglshader=start=0.0:duration=5.00:pip_duration=5.00:ext_source=movie/simple.18.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out17]; \

[18:v]trim=0.0:4.00,setpts=PTS-STARTPTS[v18B]; \
[v18B]pipglshader=start=0.0:duration=4.00:pip_duration=4.00:ext_source=movie/simple.19.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out18]; \

[19:v]trim=0.0:6.00,setpts=PTS-STARTPTS[v19B]; \
[v19B]pipglshader=start=0.0:duration=6.00:pip_duration=6.00:ext_source=movie/simple.20.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out19]; \

[20:v]trim=0.0:9.50,setpts=PTS-STARTPTS[v20B]; \
[v20B]pipglshader=start=0.0:duration=9.50:pip_duration=9.50:ext_source=movie/simple.21.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out20]; \

[21:v]trim=0.0:3.50,setpts=PTS-STARTPTS[v21B]; \
[v21B]pipglshader=start=0.0:duration=3.50:pip_duration=3.50:ext_source=movie/simple.22.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out21]; \

[22:v]trim=0.0:19.38,setpts=PTS-STARTPTS[v22B]; \
[v22B]pipglshader=start=0.0:duration=19.38:pip_duration=19.38:ext_source=movie/simple.23.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out22]; \

[23:v]trim=0.0:-3.10,setpts=PTS-STARTPTS[v23B]; \
[v23B]pipglshader=start=0.0:duration=-3.10:pip_duration=-3.10:ext_source=movie/simple.24.an.mp4:vxsource=gl_pip/pip_vertex2.gl:sdsource=gl_pip/pip_shader2.gl[out23]; \

[24:v]trim=0.0:-.10,setpts=PTS-STARTPTS[v24B]; \
[out0][out1][out2][out3][out4][out5][out6][out7][out8][out9][out10][out11][out12][out13][out14][out15][out16][out17][out18][out19][out20][out21][out22][out23][v24B]concat=n=25[outv] \
" \
-map "[outv]" \
-an \
-c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart -vsync 2 \
-y output_movie.mp4
