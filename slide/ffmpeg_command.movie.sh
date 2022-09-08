bin/ffmpeg \
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
-filter_complex " \
[0:v]split[v0a][v0b]; \
[v0a]trim=0.0:2.00[v0A]; \
[v0b]trim=2.00:5.00,setpts=PTS-STARTPTS[v0B]; \
[v0B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.02.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out0]; \

[1:v]split[v1a][v1b]; \
[v1a]trim=3.0:6.00,setpts=PTS-STARTPTS[v1A]; \
[v1b]trim=6.00:9.00,setpts=PTS-STARTPTS[v1B]; \
[v1B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.03.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out1]; \

[2:v]split[v2a][v2b]; \
[v2a]trim=3.0:9.00,setpts=PTS-STARTPTS[v2A]; \
[v2b]trim=9.00:12.00,setpts=PTS-STARTPTS[v2B]; \
[v2B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.04.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out2]; \

[3:v]split[v3a][v3b]; \
[v3a]trim=3.0:10.00,setpts=PTS-STARTPTS[v3A]; \
[v3b]trim=10.00:13.00,setpts=PTS-STARTPTS[v3B]; \
[v3B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.05.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out3]; \

[4:v]split[v4a][v4b]; \
[v4a]trim=3.0:6.00,setpts=PTS-STARTPTS[v4A]; \
[v4b]trim=6.00:9.00,setpts=PTS-STARTPTS[v4B]; \
[v4B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.06.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out4]; \

[5:v]split[v5a][v5b]; \
[v5a]trim=3.0:4.00,setpts=PTS-STARTPTS[v5A]; \
[v5b]trim=4.00:7.00,setpts=PTS-STARTPTS[v5B]; \
[v5B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.07.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out5]; \

[6:v]split[v6a][v6b]; \
[v6a]trim=3.0:5.50,setpts=PTS-STARTPTS[v6A]; \
[v6b]trim=5.50:8.50,setpts=PTS-STARTPTS[v6B]; \
[v6B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.08.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out6]; \

[7:v]split[v7a][v7b]; \
[v7a]trim=3.0:5.00,setpts=PTS-STARTPTS[v7A]; \
[v7b]trim=5.00:8.00,setpts=PTS-STARTPTS[v7B]; \
[v7B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.09.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out7]; \

[8:v]split[v8a][v8b]; \
[v8a]trim=3.0:6.00,setpts=PTS-STARTPTS[v8A]; \
[v8b]trim=6.00:9.00,setpts=PTS-STARTPTS[v8B]; \
[v8B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.10.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out8]; \

[9:v]split[v9a][v9b]; \
[v9a]trim=3.0:4.50,setpts=PTS-STARTPTS[v9A]; \
[v9b]trim=4.50:7.50,setpts=PTS-STARTPTS[v9B]; \
[v9B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.11.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out9]; \

[10:v]split[v10a][v10b]; \
[v10a]trim=3.0:4.00,setpts=PTS-STARTPTS[v10A]; \
[v10b]trim=4.00:7.00,setpts=PTS-STARTPTS[v10B]; \
[v10B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.12.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out10]; \

[11:v]split[v11a][v11b]; \
[v11a]trim=3.0:6.00,setpts=PTS-STARTPTS[v11A]; \
[v11b]trim=6.00:9.00,setpts=PTS-STARTPTS[v11B]; \
[v11B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.13.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out11]; \

[12:v]split[v12a][v12b]; \
[v12a]trim=3.0:5.50,setpts=PTS-STARTPTS[v12A]; \
[v12b]trim=5.50:8.50,setpts=PTS-STARTPTS[v12B]; \
[v12B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.14.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out12]; \

[13:v]split[v13a][v13b]; \
[v13a]trim=3.0:45.50,setpts=PTS-STARTPTS[v13A]; \
[v13b]trim=45.50:48.50,setpts=PTS-STARTPTS[v13B]; \
[v13B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.15.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out13]; \

[14:v]split[v14a][v14b]; \
[v14a]trim=3.0:7.00,setpts=PTS-STARTPTS[v14A]; \
[v14b]trim=7.00:10.00,setpts=PTS-STARTPTS[v14B]; \
[v14B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.16.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out14]; \

[15:v]split[v15a][v15b]; \
[v15a]trim=3.0:15.00,setpts=PTS-STARTPTS[v15A]; \
[v15b]trim=15.00:18.00,setpts=PTS-STARTPTS[v15B]; \
[v15B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.17.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out15]; \

[16:v]split[v16a][v16b]; \
[v16a]trim=3.0:6.00,setpts=PTS-STARTPTS[v16A]; \
[v16b]trim=6.00:9.00,setpts=PTS-STARTPTS[v16B]; \
[v16B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.18.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out16]; \

[17:v]split[v17a][v17b]; \
[v17a]trim=3.0:5.00,setpts=PTS-STARTPTS[v17A]; \
[v17b]trim=5.00:8.00,setpts=PTS-STARTPTS[v17B]; \
[v17B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.19.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out17]; \

[18:v]split[v18a][v18b]; \
[v18a]trim=3.0:10.00,setpts=PTS-STARTPTS[v18A]; \
[v18b]trim=10.00:13.00,setpts=PTS-STARTPTS[v18B]; \
[v18B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.20.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out18]; \

[19:v]split[v19a][v19b]; \
[v19a]trim=3.0:9.50,setpts=PTS-STARTPTS[v19A]; \
[v19b]trim=9.50:12.50,setpts=PTS-STARTPTS[v19B]; \
[v19B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.21.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out19]; \

[20:v]split[v20a][v20b]; \
[v20a]trim=3.0:10.50,setpts=PTS-STARTPTS[v20A]; \
[v20b]trim=10.50:13.50,setpts=PTS-STARTPTS[v20B]; \
[v20B]pipglshader=start=0.0:duration=3.0:pip_duration=3.0:ext_source=movie/simple.22.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out20]; \

[21:v]trim=19.38:22.38,setpts=PTS-STARTPTS[v21B]; \
[v0A][out0][v1A][out1][v2A][out2][v3A][out3][v4A][out4][v5A][out5][v6A][out6][v7A][out7][v8A][out8][v9A][out9][v10A][out10][v11A][out11][v12A][out12][v13A][out13][v14A][out14][v15A][out15][v16A][out16][v17A][out17][v18A][out18][v19A][out19][v20A][out20][v21B]concat=n=43[outv] \
" \
-map "[outv]" \
-an \
-c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart -vsync 2 \
-y output_movie.mp4
