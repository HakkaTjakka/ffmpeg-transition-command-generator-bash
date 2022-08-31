bin1/ffmpeg \
-i "russel.01.mp4" \
-i "russel.02.mp4" \
-i "russel.03.mp4" \
-filter_complex " \
[0:v]pipglshader=start=71.52:duration=5.0:pip_duration=5.0:ext_source=russel.02.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out0]; \
[0:a][1:a]acrossfade=duration=5.0[outa1]; \
[1:v]trim=5.0:18.52,setpts=PTS-STARTPTS[v1a]; \
[v1a]pipglshader=start=8.52:duration=5.0:pip_duration=5.0:ext_source=russel.03.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out1]; \
[outa1][2:a]acrossfade=duration=5.0[outa]; \
[2:v]trim=5.0:13.52,setpts=PTS-STARTPTS[v2a]; \
[out0][out1][v2a]concat=n=3[outv] \
" \
-map "[outv]" \
-map "[outa]" \
-c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart \
-y output_plus_auto.mp4
