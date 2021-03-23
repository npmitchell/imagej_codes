
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
for (j = 0; j < list.length; j++){
    //action(input, output, list[i]);
	name=list[j];
	print(name);
}

//for (i = 0; i < list.length; i++){
todo = newArray("7") ;
// ,120,132,135,137,141,147,162,164,166);
for (j = 0; j < 1; j++){
    //action(input, output, list[i]);
	i = todo[j];
	print(i);
}


for (j = 0; j < 1; j++){
    //action(input, output, list[i]);
	i = todo[j];
	
	name=list[i];
	ix = indexOf(name, ".tif");
	name = substring(name, 0, ix); 
	print("Loading "+name);
	open(inDir + list[i]);
	
	selectWindow(name+".tif");

	print("Filtering "+name);
	run("Median 3D...", "x=3 y=3 z=3");

    // RESLICE along Y, ROTATE, RESLICE again
	print("Slicing "+name);
	run("Reslice [/]...", "output=1.000 start=Top avoid");
	print("Rotating by large angle "+name);
	run("Rotate... ", "angle=-41 grid=1 interpolation=Bilinear enlarge stack");
	print("Slicing again "+name);
	run("Reslice [/]...", "output=1.000 start=Left avoid");
	
	// Reslice ONCE AGAIN for Dorsal and Ventral views
	print("Slicing again again "+name);
	run("Reslice [/]...", "output=1.000 start=Left avoid");
	print("Rotating again by small angle "+name);
	run("Rotate... ", "angle=2 grid=1 interpolation=Bilinear enlarge stack");
	
	// fix orientation
	// run("Rotate 90 Degrees Left") ;
	
	////////////////////////////////////////////////////
	// Reslice ONCE AGAIN for Lateral views
	print("Reslicing last time "+name);
	run("Reslice [/]...", "output=1.000 start=Bottom avoid");
	
	// Chop Left "half" --> can be more than half
	print("Left substack "+name);
	run("Make Substack...", "slices=140-930");
}
//exit();