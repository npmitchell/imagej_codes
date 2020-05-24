function createMIP(inputDir, fileName, outputDir){
inputFile = inputDir + fileName ;
outputFile = outputDir + "MAX_" + fileName ;
open(inputFile);
run("Z Project...", "projection=[Max Intensity]");
saveAs("Tiff", outputFile);
}
