


outdir="/Volumes/Pal/gut_2021b/48YG4kGCAMP6s/202106231830/";
dateStr="202106231830";

//run("Combine...", "stack1=e1_Merged_ch1_rot.avi stack2=e1_Merged_ch2_rot.avi combine");
//run("AVI... ", "compression=JPEG frame=6 save="+outdir+dateStr+"_e1_CombinedStacks_rot.avi");
run("Combine...", "stack1=e2_Merged_ch1_rot.avi stack2=e2_Merged_ch2_rot.avi combine");
run("AVI... ", "compression=JPEG frame=6 save="+outdir+dateStr+"_e2_CombinedStacks_rot.avi");
run("Combine...", "stack1=e3_Merged_ch1_rot.avi stack2=e3_Merged_ch2_rot.avi combine");
run("AVI... ", "compression=JPEG frame=6 save="+outdir+dateStr+"_e3_CombinedStacks_rot.avi");