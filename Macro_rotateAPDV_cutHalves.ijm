
// .ijm
// Load a series of TIFF stacks, Rotate in 3D around y axis 
// by reslicing, rotating, and reslicing again, take MIP along z,
// adjust the LUT, and save as PNG, one by one.
// NPMitchell 2021

inDir0="/mnt/crunch/48Ygal4-UAShistRFP/201904031830_great/";
inDir=inDir0+"Time4views_60sec_1p4um_25x_1p0mW_exp0p35_2/data/deconvolved_16bit/masked_data/";
outDir=inDir+"rotatedAPDVfilt/";

list = getFileList(inDir);

print("Searching in "+inDir) ;
for (i = list.length-1; i < list.length; i++){
    //action(input, output, list[i]);
	name=list[i];
	print(name);
}

//for (i = 0; i < list.length; i++){
for (i = list.length-1; i < list.length; i++){
    //action(input, output, list[i]);
	
	open(inDir + list[i]);
	
	name=list[i];
	ix = indexOf(name, ".tif");
	name = substring(name, 0, ix); 
	
	selectWindow(name+".tif");

	run("Median 3D...", "x=2 y=2 z=2");

    // RESLICE along Y, ROTATE, RESLICE again
	run("Reslice [/]...", "output=1.000 start=Top avoid");
	run("Rotate... ", "angle=-41 grid=1 interpolation=Bilinear enlarge stack");

	run("Reslice [/]...", "output=1.000 start=Left avoid");
	
	// fix orientation
	run("Rotate 90 Degrees Left") ;

	// Chop in half
	run("Make Substack...", "delete slices=1-475");
	run("Z Project...", "projection=[Max Intensity]");

	run("Enhance Contrast", "saturated=2.5");
	saveAs("PNG",outDir+name+"_lateralR.png");

	// Go to other half
	close();
	close();

	// Z project and save
	run("Z Project...", "projection=[Max Intensity]");
	run("Enhance Contrast", "saturated=2.5");
	saveAs("PNG",outDir+name+"_lateralL.png");
	close();
	close();
	close();
	close();
	
}