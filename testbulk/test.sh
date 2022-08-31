#!/bin/bash

COUNT="0"
ONE="1.0"
TEN="10"
func_done () {
	COUNT=$(echo "($COUNT+$ONE)"| bc -l);  
    COUNT="${COUNT%.*}"
    if [ "$COUNT" -lt "$TEN" ]; then
    	COUNT=0"$COUNT" out.$COUNT.mp4
    fi
    echo $COUNT $2 $3 $1
}

func_add () {
	COUNT=$(echo "($COUNT+$ONE)"| bc -l);  
    COUNT="${COUNT%.*}"
    if [ "$COUNT" -lt "$TEN" ]; then
    	COUNT=0"$COUNT"
    fi
    echo $COUNT $4 $2 $3 $1 out.$COUNT.mp4
	ffmpeg -hide_banner -y -loglevel warning -ss $4 -i "$1" -ss $2 -t $3 -filter_complex "[0:v]fps=fps=30000/1001,scale=1280:720,setsar=1/1;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k out.$COUNT.mp4
#	ffmpeg -hide_banner -y -loglevel warning -i "$1" -ss $2 -t $3 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k out.$COUNT.mp4
}

func_done 		"48367_01_hd.mp4" 											00:00:50 00:00:11 00:00:00
func_done		"48367_03_hd.mp4" 											00:01:23 00:00:06 00:00:00
func_done		"30948_03_hd.mp4" 											00:01:03 00:00:15 00:00:00
func_done		"30948_04_hd.mp4" 											00:00:38 00:00:08 00:00:00
func_done		"48367_02_hd.mp4" 											00:01:26 00:00:30 00:00:00
func_done 		"48367_04_hd.mp4" 											00:01:22 00:00:15 00:00:00
func_done 		"Angel.Youngs.Fucked.And.Manhandle.mp4"						00:00:08 00:00:20 00:00:00
func_done 		"Avery.Black.Tiny.Girl.Dominated.mp4"						00:00:08 00:00:10 00:00:00
func_done 		"Avery.Black.Tiny.Girl.Dominated.mp4"						00:00:35 00:00:20 00:00:00
func_done 		"Bella Luna - Fucked And Dominated  [480p].mp4"				00:00:03 00:00:10 00:00:00
func_done		"Charlie Valentine - Fucking Submission  [480p].mp4"		00:00:03 00:00:30 00:00:00
func_done		"EvilAngel.Alicia.Reign.Submits.In.Nasty.Hookup.480p.mp4"	00:00:05 00:00:10 00:00:00
func_done		"EvilAngel.Alicia.Reign.Submits.In.Nasty.Hookup.480p.mp4"	00:00:45 00:00:15 00:00:00
func_done		"EvilAngel.Allie.Addison.Orgasmic.Fuck.N.Facial.480p.mp4"	00:00:05 00:00:10 00:00:00
func_done		"EvilAngel.Allie.Addison.Orgasmic.Fuck.N.Facial.480p.mp4"	00:00:30 00:00:06 00:00:00
func_done		"EvilAngel.Allie.Addison.Orgasmic.Fuck.N.Facial.480p.mp4"	00:01:10 00:00:12 00:00:00
func_done		"EvilAngel.Bella.Luna.Fucked.Into.Submission.480p.mp4"		00:00:02 00:00:12 00:00:00
func_done		"EvilAngel.Bella.Luna.Fucked.Into.Submission.480p.mp4"		00:01:10 00:00:10 00:00:00
func_done		"EvilAngel.Bella.Luna.Fucked.Into.Submission.480p.mp4"		00:01:20 00:00:10 00:00:00
func_done		"EvilAngel.Bella.Luna.Fucked.Into.Submission.480p.mp4"		00:01:37 00:00:12 00:00:00
func_done		"EvilAngel.Charly.Summer.Submits.To.Nasty.Stud.480p.mp4"	00:00:02 00:00:10 00:00:00
func_done		"EvilAngel.Charly.Summer.Submits.To.Nasty.Stud.480p.mp4"	00:00:20 00:00:06 00:00:00
func_done		"EvilAngel.Charly.Summer.Submits.To.Nasty.Stud.480p.mp4"	00:00:55 00:00:11 00:00:00
func_done		"EvilAngel.Jessie.Saint.Nasty.Sexual.Habits.480p.mp4"		00:00:02 00:00:10 00:00:00
func_done		"EvilAngel.Jessie.Saint.Nasty.Sexual.Habits.480p.mp4"		00:00:26 00:00:13 00:00:00
func_done		"EvilAngel.Kitt.Lacey.Submits.To.Freaky.Stranger.480p.mp4"	00:00:02 00:00:10 00:00:00
func_done		"EvilAngel.Kitt.Lacey.Submits.To.Freaky.Stranger.480p.mp4"	00:00:55 00:00:07 00:00:00
func_done		"EvilAngel.Kitt.Lacey.Submits.To.Freaky.Stranger.480p.mp4"	00:01:06 00:00:10 00:00:00
func_done       "EvilAngel.Lilly Bell Dominated, Dicked, Facialed.480p.mp4" 00:00:07 00:00:10 00:00:00
func_done		"EvilAngel.Michelle.Anthony.Fuck.N.Facial.Hookup.480p.mp4"	00:00:02 00:00:10 00:00:00
func_done		"EvilAngel.Nella.Jones.Gaping.Anal.And.A2M.BJ.480p.mp4"		00:02:28 00:00:10 00:00:00
func_done		"EvilAngel.Scarlet.Skies.Shameless.Submission.480p.mp4"		00:00:02 00:00:10 00:00:00
func_done		"EvilAngelChloe.Cherry.Orgasmic.Anal.Hookup.480p.mp4"		00:01:38 00:00:10 00:00:00
func_done		"hookup-hotshot-best-friends-4ever-scene-1.720p.mp4"		00:00:42 00:00:10 00:00:00
func_done		"hookup-hotshot-best-friends-4ever-scene-2.720p.mp4"		00:00:02 00:00:10 00:00:00
func_done		"hookup-hotshot-best-friends-4ever-scene-3.720p.mp4"		00:00:02 00:00:10 00:00:00
func_done		"hookup-hotshot-best-friends-4ever-scene-4.720p.mp4"		00:00:02 00:00:10 00:00:00
func_done		"Hookup Hotshot Extreme Highlights cd1.mp4"					00:02:30 00:00:10 00:00:00
func_done		"Hookup Hotshot Extreme Highlights cd1.mp4"					00:01:00 00:00:10 01:02:20
func_done		"Hookup Hotshot Extreme Highlights cd1.mp4"					00:01:00 00:00:06 01:57:54
func_done		"Hookup Hotshot Extreme Highlights cd2.mp4"					00:01:45 00:00:12 00:00:00
func_done		"Hookup Hotshot Extreme Highlights cd2.mp4"					00:01:00 00:00:12 01:58:03
func_done		"Hookup Hotshot Extreme Highlights cd2.mp4"					00:01:00 00:00:12 02:57:10
func_done		"Jasmine Wilde - Fuck Date Submission [480p].mp4"			00:00:02 00:00:10 00:00:00
func_done		"Lana Smalls - Submissive Girl Squirts [480p].mp4"			00:00:02 00:00:10 00:00:00
func_done		"Nikole Nash Submissive Anal Spinner!.mp4"					00:00:08 00:00:10 00:00:00
func_done		"ps-hheh2-d1.mp4"											00:03:53 00:00:10 00:00:00
func_done		"ps-hheh2-d1.mp4"											00:01:00 00:00:10 01:16:03
func_done		"ps-hheh2-d2.mp4"											00:02:34 00:00:12 00:00:00
func_done		"ps-hheh2-d2.mp4"											00:01:00 00:00:12 01:22:23
func_done		"September.Reign.Orgasmic.Cock.Ride..mp4"					00:00:10 00:00:10 00:00:00

./test_plus.sh
./ffmpeg_command.plus.sh