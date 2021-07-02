ang1="-5";
ang2="0";
ang3="-2";
//outdir="/mnt/data/confocal_data/gut/48YGAL4klarGCAMPGFP/PosteriorFold/202106231410/";

outdir="/Volumes/Pal/gut_2021b/48YG4kGCAMP6s/202106231830/";


run("Merge Channels...", "c1=e1a-1.tif c2=e1b-1.tif c3=e1c-1.tif create");
saveAs("Tiff", outdir+"e1_Merged_ch1.tif");

run("Merge Channels...", "c1=e1a-2.tif c2=e1b-2.tif c3=e1c-2.tif create");
saveAs("Tiff", outdir+"e1_Merged_ch2.tif");

run("Merge Channels...", "c1=e2a-1.tif c2=e2b-1.tif c3=e2c-1.tif create");
saveAs("Tiff", outdir+"e2_Merged_ch1.tif");

run("Merge Channels...", "c1=e2a-2.tif c2=e2b-2.tif c3=e2c-2.tif create");
saveAs("Tiff", outdir+"e2_Merged_ch2.tif");

run("Merge Channels...", "c1=e3a-1.tif c2=e3b-1.tif c3=e3c-1.tif create");
saveAs("Tiff", outdir+"e3_Merged_ch1.tif");

run("Merge Channels...", "c1=e3a-2.tif c2=e3b-2.tif c3=e3c-2.tif create");
saveAs("Tiff", outdir+"e3_Merged_ch2.tif");


selectWindow("e1_Merged_ch1.tif");
run("Rotate... ", "angle="+ang1+" grid=1 interpolation=Bilinear fill enlarge");
saveAs("Tiff", outdir+"e1_Merged_ch1_rot.tif");

selectWindow("e1_Merged_ch2.tif");
run("Rotate... ", "angle="+ang1+" grid=1 interpolation=Bilinear fill enlarge");
saveAs("Tiff", outdir+"e1_Merged_ch2_rot.tif");

selectWindow("e2_Merged_ch1.tif");
run("Rotate... ", "angle="+ang2+" grid=1 interpolation=Bilinear fill enlarge");
saveAs("Tiff", outdir+"e2_Merged_ch1_rot.tif");

selectWindow("e2_Merged_ch2.tif");
run("Rotate... ", "angle="+ang2+" grid=1 interpolation=Bilinear fill enlarge");
saveAs("Tiff", outdir+"e2_Merged_ch2_rot.tif");

selectWindow("e3_Merged_ch1.tif");
run("Rotate... ", "angle="+ang3+" grid=1 interpolation=Bilinear fill enlarge");
saveAs("Tiff", outdir+"e3_Merged_ch1_rot.tif");

selectWindow("e3_Merged_ch2.tif");
run("Rotate... ", "angle="+ang3+" grid=1 interpolation=Bilinear fill enlarge");
saveAs("Tiff", outdir+"e3_Merged_ch2_rot.tif");

// Now make videos