// for 2-color images
datdir="/mnt/data/optogenetics_lightsheet/AntpGAL4OCRL/20210305_e2_focus_phalloidin488_1p4um_0p25ms0p5ms_1mW2mW_GFP2RFP/Fix3views_e2/";

minx="284";
miny="320";
minz="150";
maxx="912";
maxy="1388";
maxz="726";

process_acit="process_angle=[All angles] process_channel=[All channels] process_illumination=[All illuminations] process_timepoint=[All Timepoints]";
xml="select_xml="+datdir+"dataset.xml ";

// DETECTION
//detectOpts=" type_of_interest_point_detection=Difference-of-Gaussian label_interest_points=beads downsample_images set_minimal_and_maximal_intensity subpixel_localization=[3-dimensional quadratic fit] interest_point_specification=[Advanced ...] downsample_xy=[Match Z Resolution (less downsampling)] downsample_z=1x minimal_intensity=200 maximal_intensity=800 sigma=1.80150 threshold=0.2020 find_maxima compute_on=[CPU (Java)]";
//run("Detect Interest Points for Registration", xml+process_acit+detectOpts);

// FAST REGISTRATION
//fastOptions=process_acit+"registration_algorithm=[Fast 3d geometric hashing (rotation invariant)] type_of_registration=[Register timepoints individually] interest_points_channel_1=beads interest_points_channel_2=beads fix_tiles=[Fix first tile] map_back_tiles=[Do not map back (use this if tiles are fixed)] transformation=Affine regularize_model model_to_regularize_with=Rigid lamba=0.10 allowed_error_for_ransac=5 significance=10";
run("Register Dataset based on Interest Points", xml+fastOptions);

// FUSE THE RESULT
run("Fuse/Deconvolve Dataset", "select_xml="+datdir+"dataset.xml "+process_acit+" type_of_image_fusion=[Weighted-average fusion] bounding_box=[Define manually] fused_image=[Save as TIFF stack] minimal_x="+minx+" minimal_y="+miny+" minimal_z="+minz+" maximal_x="+maxx+" maximal_y="+maxy+" maximal_z="+maxz+" downsample=1 pixel_type=[16-bit unsigned integer] imglib2_container=[CellImg (large images)] process_views_in_paralell=All blend interpolation=[Linear Interpolation] output_file_directory="+datdir);
datdir="/mnt/data/optogenetics_lightsheet/AntpGAL4OCRL/20210305_e2_focus_phalloidin488_1p4um_0p25ms0p5ms_1mW2mW_GFP2RFP/Fix3views_e2/";

open(datdir+"TP0_Ch1_Ill0_Ang0,60,120,180,240,300.tif")
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
open(datdir+"TP0_Ch2_Ill0_Ang0,60,120,180,240,300.tif")
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");

// REDUNDANT REGISTRATION
redOptions=process_acit+" registration_algorithm=[Redundant geometric local descriptor matching (translation invariant)] type_of_registration=[Register timepoints individually] interest_points_channel_1=beads interest_points_channel_2=beads fix_tiles=[Fix first tile] map_back_tiles=[Do not map back (use this if tiles are fixed)] transformation=Affine regularize_model model_to_regularize_with=Rigid lamba=0.10 number_of_neighbors=3 redundancy=1 significance=3 allowed_error_for_ransac=5";
run("Register Dataset based on Interest Points", xml+redOptions);

// ICP REGISTRATION
icpOptions=process_acit+" registration_algorithm=[Iterative closest-point (ICP, no invariance)] type_of_registration=[Register timepoints individually] interest_points_channel_1=beads interest_points_channel_2=beads fix_tiles=[Fix first tile] map_back_tiles=[Do not map back (use this if tiles are fixed)] transformation=Affine regularize_model model_to_regularize_with=Rigid lamba=0.10 maximal_distance=5 maximal_number=100";
run("Register Dataset based on Interest Points", xml+icpOptions);

// FUSE THE RESULT
run("Fuse/Deconvolve Dataset", "select_xml="+datdir+"dataset.xml "+process_acit+" type_of_image_fusion=[Weighted-average fusion] bounding_box=[Define manually] fused_image=[Save as TIFF stack] minimal_x="+minx+" minimal_y="+miny+" minimal_z="+minz+" maximal_x="+maxx+" maximal_y="+maxy+" maximal_z="+maxz+" downsample=1 pixel_type=[16-bit unsigned integer] imglib2_container=[CellImg (large images)] process_views_in_paralell=All blend interpolation=[Linear Interpolation] output_file_directory="+datdir);
open(datdir+"TP0_Ch1_Ill0_Ang0,60,120,180,240,300.tif")
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");



numiter="30"
bsx="768" // for M10 // "1000" for RTX // 768 for Titan
bsy="800" // for M10 // "1400" for RTX // 1280 for Titan
bsz="768" // for M10 // "1000" for RTX // 768 for Titan
options="select_xml="+datadir+"dataset.xml "
options+="process_angle=[All angles] process_channel=[All channels] process_illumination=[All illuminations] "
options+="process_timepoint=[All timepoints] "
options+="type_of_image_fusion=[Multi-view deconvolution] bounding_box=[Define manually] fused_image=[Save as TIFF stack] "
options+="minimal_x="+xmin+" minimal_y="+ymin+" minimal_z="+zmin+" "
options+="maximal_x="+xmax+" maximal_y="+ymax+" maximal_z="+zmax+" "
options+="imglib2_container=[CellImg (large images)] imglib2_container_ffts=ArrayImg "
options+="type_of_iteration=[Efficient Bayesian - Optimization I (fast, precise)] image_weights=[Virtual weights (less memory, slower)] "
options+="osem_acceleration=[1 (balanced)] number_of_iterations="+numiter+" use_tikhonov_regularization tikhonov_parameter=0.0060 compute=[specify maximal blocksize manually] "
options+="compute_on=[GPU (Nvidia CUDA via JNA)] psf_estimation=[Extract from beads] psf_display=[Do not show PSFs] "
options+="output_file_directory="+datadir+outdir+" ";
options+="blocksize_x="+bsx+" blocksize_y="+bsy+" blocksize_z="+bsz+" cuda_directory=/opt/Fiji.app/lib/linux64 select_native_library_for_cudafourierconvolution=libConvolution3D_fftCUDAlib.so "
options+="gpu_1 ";

// OPTION 1
options+="detections_to_extract_psf_for_channel_0=beads psf_size_x=19 psf_size_y=19 psf_size_z=25" ;

//OPTION 2
//options+="use_same_psf_for_all_angles/illuminations browse=["+datadir+"psfs/Avg original PSF's.tif] "
//options+="transform_psfs psf_file=["+datadir+"psf//Avg original PSF's.tif]"

// Run it:
run("Fuse/Deconvolve Dataset", options);
//run("Quit");
//eval("script", "System.exit(0);");





