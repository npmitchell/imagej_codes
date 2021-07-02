
//Options
ename="e4c";
slice0="7";
//outdir="/mnt/data/confocal_data/gut/48YGAL4klarGCAMPGFP/PosteriorFold/202106231410/";
//outdir="/Volumes/Pal/gut_2021b/48YG4kGCAMP6s/202106231830/";
outdir="/Users/npmitchell/Desktop/gut/Mef2GAL4klarUASGCAMP6sIII/202106261342_mef2G4kGCAMP6s3_40x1p5x_1p5um_8p7sps_90spf_10pc_775ns/";

// Protocol
//run("Flip Horizontally", "stack");
run("Flip Vertically", "stack");
//run("Z Project...", "start=1 projection=[Max Intensity] all");
run("Make Substack...", "channels=1 slices="+slice0+"-16");
run("Z Project...", "start=1 projection=[Max Intensity] all");
saveAs("Tiff", outdir+ename+"-1.tif");
close();
close();

run("Make Substack...", "channels=2 slices=12-16");
run("Z Project...", "start=1 projection=[Max Intensity] all");
saveAs("Tiff", outdir+ename+"-2.tif");
close();
close();
//close();
