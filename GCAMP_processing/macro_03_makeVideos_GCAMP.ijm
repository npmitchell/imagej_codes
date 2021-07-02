
// Make videos
outdir="/Volumes/Pal/gut_2021b/48YG4kGCAMP6s/202106231830/";
ch="2" ;

selectWindow("e1_Merged_ch"+ch+"_rot.tif");
run("Label...", "format=00:00 starting=0 interval=90 x=30 y=30 font=14 text=[] range=1-67 use");
run("Scale Bar...", "width=50 height=4 font=14 color=White background=None location=[Lower Right] bold overlay");
run("AVI... ", "compression=JPEG frame=6 save="+outdir+"e1_Merged_ch"+ch+"_rot.avi");
run("Save");


selectWindow("e2_Merged_ch"+ch+"_rot.tif");
run("Label...", "format=00:00 starting=0 interval=90 x=30 y=30 font=14 text=[] range=1-67 use");
run("Scale Bar...", "width=50 height=4 font=14 color=White background=None location=[Lower Right] bold overlay");
run("AVI... ", "compression=JPEG frame=6 save="+outdir+"e2_Merged_ch"+ch+"_rot.avi");
run("Save");

selectWindow("e3_Merged_ch"+ch+"_rot.tif");
run("Label...", "format=00:00 starting=0 interval=90 x=30 y=30 font=14 text=[] range=1-67 use");
run("Scale Bar...", "width=50 height=4 font=14 color=White background=None location=[Lower Right] bold overlay");
run("AVI... ", "compression=JPEG frame=6 save="+outdir+"e3_Merged_ch"+ch+"_rot.avi");
run("Save");
