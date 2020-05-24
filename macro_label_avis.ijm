run("Size...", "width=1024 height=700 depth=500 constrain average interpolation=Bilinear");
//run("Flip Horizontally", "stack");
run("Flip Vertically", "stack");
run("Colors...", "foreground=white background=black selection=yellow");
//run("Rotate... ", "angle=5 grid=1 interpolation=Bilinear fill stack");
run("Scale Bar...", "width=50 height=8 font=36 color=White background=None location=[Lower Right] bold overlay");
run("Label...", "format=00:00 starting=0 interval=1 x=5 y=20 font=36 text=[] range=1-500 use");
//run("AVI... ", "compression=JPEG frame=15 save=/mnt/data/optogenetics/20200512_mef2GAL4klarpmCIBNchCRY2rhoGEF_tilescan/"+
//"Position013_1920_nextday_40pc40pc_single_slice_labeled.avi");
