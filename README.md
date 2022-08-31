# ffmpeg transition command generator (bash)
Generates ffmpeg command ((2) transitions) for auto transitions between video's. (1) Uses FFmpeg-Plus-OpenGL

*****************************


Added just like on transitions ffmpeg command generator in:
  https://github.com/HakkaTjakka/ffmpeg-transition-command-generator-bash/blob/main/test_plus.sh

Generates output to:
  https://github.com/HakkaTjakka/ffmpeg-transition-command-generator-bash/blob/main/ffmpeg_command.plus.sh
*****************************

Two OpenGL transition add-ons for ffmpeg with shaders:

1) Plus-OpenGL

FFmpeg-Plus-OpenGL.tar.xz           GitHub c-source + patch file. If patch not working aply manually.
FFmpeg_Patched_Plus_OpenGL.tar.xz   Patched ffmpeg (ffmpeg.tar.gz, 4.3.1) according to README.md

gl/                                 Uses directory gl for shaders. (Also inside FFmpeg-Plus-OpenGL.tar.xz) (In root for testing purposes)

Linux executables with nvenc encoding in bin1
./ffmpeg -help filter=plusglshader

Test: test_plus.sh

2) transitions

ffmpeg-gl-transition.tar.xz         GitHub c-source + patch file. If patch not working aply manually.
gl-transitions.tar.xz               shaders
FFmpeg-Patched-gl-transition.tar.xz Patched ffmpeg (ffmpeg.tar.gz, 4.3.1) according to README.md

transitions/                        Uses directory transitions for shaders. (Also inside gl-transitions.tar.xz) (In root for testing purposes)

vf_gltransition.c
ffmpeg-gl-transition.tar.xz # define GL_TRANSITION_USING_EGL //remove this line if you don't want to use EGL

COMMENTED (//) OUT IN:

FFmpeg-Patched-gl-transition.tar.xz
vf_gltransition.c //# define GL_TRANSITION_USING_EGL //remove this line if you don't want to use EGL

Linux executables with nvenc encoding in bin2
./ffmpeg -v 0 -filters | grep gltransition

Test: test_transition.sh

ffmpeg.tar.gz                       FFmpeg source 4.3.1 (not patched) (used on both systems)

Test both: start_test.sh

Soon: new shaders (Plus-OpenGL vertex + fragment) (transition .glsl only?) for more effects.


 
