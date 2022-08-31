bin1/ffmpeg \
-i "out.01.mp4" \
-i "out.02.mp4" \
-i "out.03.mp4" \
-i "out.04.mp4" \
-i "out.05.mp4" \
-i "out.06.mp4" \
-i "out.07.mp4" \
-i "out.08.mp4" \
-i "out.09.mp4" \
-i "out.10.mp4" \
-i "out.11.mp4" \
-i "out.12.mp4" \
-i "out.13.mp4" \
-i "out.14.mp4" \
-i "out.15.mp4" \
-i "out.16.mp4" \
-i "out.17.mp4" \
-i "out.18.mp4" \
-i "out.19.mp4" \
-i "out.20.mp4" \
-i "out.21.mp4" \
-i "out.22.mp4" \
-i "out.23.mp4" \
-i "out.24.mp4" \
-i "out.25.mp4" \
-i "out.26.mp4" \
-i "out.27.mp4" \
-i "out.28.mp4" \
-i "out.29.mp4" \
-i "out.30.mp4" \
-i "out.31.mp4" \
-i "out.32.mp4" \
-i "out.33.mp4" \
-i "out.34.mp4" \
-i "out.35.mp4" \
-i "out.36.mp4" \
-i "out.37.mp4" \
-i "out.38.mp4" \
-i "out.39.mp4" \
-i "out.40.mp4" \
-i "out.41.mp4" \
-i "out.42.mp4" \
-i "out.43.mp4" \
-i "out.44.mp4" \
-i "out.45.mp4" \
-i "out.46.mp4" \
-i "out.47.mp4" \
-i "out.48.mp4" \
-i "out.49.mp4" \
-i "out.50.mp4" \
-i "out.51.mp4" \
-filter_complex " \
[0:v]pipglshader=start=9.01:duration=2.0:pip_duration=2.0:ext_source=out.02.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out0]; \
[0:a][1:a]acrossfade=duration=2.0[outa1]; \
[1:v]trim=2.0:6.00,setpts=PTS-STARTPTS[v1a]; \
[v1a]pipglshader=start=2.00:duration=2.0:pip_duration=2.0:ext_source=out.03.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out1]; \
[outa1][2:a]acrossfade=duration=2.0[outa2]; \
[2:v]trim=2.0:15.01,setpts=PTS-STARTPTS[v2a]; \
[v2a]pipglshader=start=11.01:duration=2.0:pip_duration=2.0:ext_source=out.04.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out2]; \
[outa2][3:a]acrossfade=duration=2.0[outa3]; \
[3:v]trim=2.0:8.00,setpts=PTS-STARTPTS[v3a]; \
[v3a]pipglshader=start=4.00:duration=2.0:pip_duration=2.0:ext_source=out.05.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out3]; \
[outa3][4:a]acrossfade=duration=2.0[outa4]; \
[4:v]trim=2.0:30.00,setpts=PTS-STARTPTS[v4a]; \
[v4a]pipglshader=start=26.00:duration=2.0:pip_duration=2.0:ext_source=out.06.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out4]; \
[outa4][5:a]acrossfade=duration=2.0[outa5]; \
[5:v]trim=2.0:15.01,setpts=PTS-STARTPTS[v5a]; \
[v5a]pipglshader=start=11.01:duration=2.0:pip_duration=2.0:ext_source=out.07.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out5]; \
[outa5][6:a]acrossfade=duration=2.0[outa6]; \
[6:v]trim=2.0:20.00,setpts=PTS-STARTPTS[v6a]; \
[v6a]pipglshader=start=16.00:duration=2.0:pip_duration=2.0:ext_source=out.08.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out6]; \
[outa6][7:a]acrossfade=duration=2.0[outa7]; \
[7:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v7a]; \
[v7a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.09.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out7]; \
[outa7][8:a]acrossfade=duration=2.0[outa8]; \
[8:v]trim=2.0:20.00,setpts=PTS-STARTPTS[v8a]; \
[v8a]pipglshader=start=16.00:duration=2.0:pip_duration=2.0:ext_source=out.10.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out8]; \
[outa8][9:a]acrossfade=duration=2.0[outa9]; \
[9:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v9a]; \
[v9a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.11.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out9]; \
[outa9][10:a]acrossfade=duration=2.0[outa10]; \
[10:v]trim=2.0:30.00,setpts=PTS-STARTPTS[v10a]; \
[v10a]pipglshader=start=26.00:duration=2.0:pip_duration=2.0:ext_source=out.12.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out10]; \
[outa10][11:a]acrossfade=duration=2.0[outa11]; \
[11:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v11a]; \
[v11a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.13.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out11]; \
[outa11][12:a]acrossfade=duration=2.0[outa12]; \
[12:v]trim=2.0:15.01,setpts=PTS-STARTPTS[v12a]; \
[v12a]pipglshader=start=11.01:duration=2.0:pip_duration=2.0:ext_source=out.14.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out12]; \
[outa12][13:a]acrossfade=duration=2.0[outa13]; \
[13:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v13a]; \
[v13a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.15.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out13]; \
[outa13][14:a]acrossfade=duration=2.0[outa14]; \
[14:v]trim=2.0:6.00,setpts=PTS-STARTPTS[v14a]; \
[v14a]pipglshader=start=2.00:duration=2.0:pip_duration=2.0:ext_source=out.16.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out14]; \
[outa14][15:a]acrossfade=duration=2.0[outa15]; \
[15:v]trim=2.0:12.01,setpts=PTS-STARTPTS[v15a]; \
[v15a]pipglshader=start=8.01:duration=2.0:pip_duration=2.0:ext_source=out.17.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out15]; \
[outa15][16:a]acrossfade=duration=2.0[outa16]; \
[16:v]trim=2.0:12.01,setpts=PTS-STARTPTS[v16a]; \
[v16a]pipglshader=start=8.01:duration=2.0:pip_duration=2.0:ext_source=out.18.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out16]; \
[outa16][17:a]acrossfade=duration=2.0[outa17]; \
[17:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v17a]; \
[v17a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.19.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out17]; \
[outa17][18:a]acrossfade=duration=2.0[outa18]; \
[18:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v18a]; \
[v18a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.20.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out18]; \
[outa18][19:a]acrossfade=duration=2.0[outa19]; \
[19:v]trim=2.0:12.01,setpts=PTS-STARTPTS[v19a]; \
[v19a]pipglshader=start=8.01:duration=2.0:pip_duration=2.0:ext_source=out.21.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out19]; \
[outa19][20:a]acrossfade=duration=2.0[outa20]; \
[20:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v20a]; \
[v20a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.22.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out20]; \
[outa20][21:a]acrossfade=duration=2.0[outa21]; \
[21:v]trim=2.0:6.00,setpts=PTS-STARTPTS[v21a]; \
[v21a]pipglshader=start=2.00:duration=2.0:pip_duration=2.0:ext_source=out.23.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out21]; \
[outa21][22:a]acrossfade=duration=2.0[outa22]; \
[22:v]trim=2.0:11.01,setpts=PTS-STARTPTS[v22a]; \
[v22a]pipglshader=start=7.01:duration=2.0:pip_duration=2.0:ext_source=out.24.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out22]; \
[outa22][23:a]acrossfade=duration=2.0[outa23]; \
[23:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v23a]; \
[v23a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.25.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out23]; \
[outa23][24:a]acrossfade=duration=2.0[outa24]; \
[24:v]trim=2.0:13.01,setpts=PTS-STARTPTS[v24a]; \
[v24a]pipglshader=start=9.01:duration=2.0:pip_duration=2.0:ext_source=out.26.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out24]; \
[outa24][25:a]acrossfade=duration=2.0[outa25]; \
[25:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v25a]; \
[v25a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.27.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out25]; \
[outa25][26:a]acrossfade=duration=2.0[outa26]; \
[26:v]trim=2.0:7.00,setpts=PTS-STARTPTS[v26a]; \
[v26a]pipglshader=start=3.00:duration=2.0:pip_duration=2.0:ext_source=out.28.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out26]; \
[outa26][27:a]acrossfade=duration=2.0[outa27]; \
[27:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v27a]; \
[v27a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.29.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out27]; \
[outa27][28:a]acrossfade=duration=2.0[outa28]; \
[28:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v28a]; \
[v28a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.30.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out28]; \
[outa28][29:a]acrossfade=duration=2.0[outa29]; \
[29:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v29a]; \
[v29a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.31.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out29]; \
[outa29][30:a]acrossfade=duration=2.0[outa30]; \
[30:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v30a]; \
[v30a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.32.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out30]; \
[outa30][31:a]acrossfade=duration=2.0[outa31]; \
[31:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v31a]; \
[v31a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.33.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out31]; \
[outa31][32:a]acrossfade=duration=2.0[outa32]; \
[32:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v32a]; \
[v32a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.34.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out32]; \
[outa32][33:a]acrossfade=duration=2.0[outa33]; \
[33:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v33a]; \
[v33a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.35.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out33]; \
[outa33][34:a]acrossfade=duration=2.0[outa34]; \
[34:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v34a]; \
[v34a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.36.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out34]; \
[outa34][35:a]acrossfade=duration=2.0[outa35]; \
[35:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v35a]; \
[v35a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.37.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out35]; \
[outa35][36:a]acrossfade=duration=2.0[outa36]; \
[36:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v36a]; \
[v36a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.38.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out36]; \
[outa36][37:a]acrossfade=duration=2.0[outa37]; \
[37:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v37a]; \
[v37a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.39.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out37]; \
[outa37][38:a]acrossfade=duration=2.0[outa38]; \
[38:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v38a]; \
[v38a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.40.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out38]; \
[outa38][39:a]acrossfade=duration=2.0[outa39]; \
[39:v]trim=2.0:6.00,setpts=PTS-STARTPTS[v39a]; \
[v39a]pipglshader=start=2.00:duration=2.0:pip_duration=2.0:ext_source=out.41.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out39]; \
[outa39][40:a]acrossfade=duration=2.0[outa40]; \
[40:v]trim=2.0:12.01,setpts=PTS-STARTPTS[v40a]; \
[v40a]pipglshader=start=8.01:duration=2.0:pip_duration=2.0:ext_source=out.42.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out40]; \
[outa40][41:a]acrossfade=duration=2.0[outa41]; \
[41:v]trim=2.0:12.01,setpts=PTS-STARTPTS[v41a]; \
[v41a]pipglshader=start=8.01:duration=2.0:pip_duration=2.0:ext_source=out.43.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out41]; \
[outa41][42:a]acrossfade=duration=2.0[outa42]; \
[42:v]trim=2.0:12.01,setpts=PTS-STARTPTS[v42a]; \
[v42a]pipglshader=start=8.01:duration=2.0:pip_duration=2.0:ext_source=out.44.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out42]; \
[outa42][43:a]acrossfade=duration=2.0[outa43]; \
[43:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v43a]; \
[v43a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.45.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out43]; \
[outa43][44:a]acrossfade=duration=2.0[outa44]; \
[44:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v44a]; \
[v44a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.46.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out44]; \
[outa44][45:a]acrossfade=duration=2.0[outa45]; \
[45:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v45a]; \
[v45a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.47.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out45]; \
[outa45][46:a]acrossfade=duration=2.0[outa46]; \
[46:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v46a]; \
[v46a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.48.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out46]; \
[outa46][47:a]acrossfade=duration=2.0[outa47]; \
[47:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v47a]; \
[v47a]pipglshader=start=6.01:duration=2.0:pip_duration=2.0:ext_source=out.49.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out47]; \
[outa47][48:a]acrossfade=duration=2.0[outa48]; \
[48:v]trim=2.0:12.01,setpts=PTS-STARTPTS[v48a]; \
[v48a]pipglshader=start=8.01:duration=2.0:pip_duration=2.0:ext_source=out.50.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out48]; \
[outa48][49:a]acrossfade=duration=2.0[outa49]; \
[49:v]trim=2.0:12.01,setpts=PTS-STARTPTS[v49a]; \
[v49a]pipglshader=start=8.01:duration=2.0:pip_duration=2.0:ext_source=out.51.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out49]; \
[outa49][50:a]acrossfade=duration=2.0[outa]; \
[50:v]trim=2.0:10.01,setpts=PTS-STARTPTS[v50a]; \
[out0][out1][out2][out3][out4][out5][out6][out7][out8][out9][out10][out11][out12][out13][out14][out15][out16][out17][out18][out19][out20][out21][out22][out23][out24][out25][out26][out27][out28][out29][out30][out31][out32][out33][out34][out35][out36][out37][out38][out39][out40][out41][out42][out43][out44][out45][out46][out47][out48][out49][v50a]concat=n=51[outv] \
" \
-map "[outv]" \
-map "[outa]" \
-c:v h264_nvenc -pix_fmt yuv420p -preset slow -movflags faststart -vsync 2 \
-y output_plus_auto.mp4
