/*
 * This macro subtracts the background, thresholds, and measures the area fraction
 * 
 * 2019-10-09
 */

 //Clean up workspace
 run("Close All");
 
// Load data
//run("Cell Colony (31K)");
open("/Users/frasersimpson/Desktop/Cell_Colony.tif");

//Subtract Background
run("Subtract Background...", "rolling=100 light sliding");

//Threshold
setAutoThreshold("Default");
//run("Threshold...");
setAutoThreshold("Otsu");
setOption("BlackBackground", true);
run("Convert to Mask");

//Measure
run("Set Measurements...", "area_fraction display redirect=None decimal=3");
run("Analyze Particles...", "  show=Masks summarize");
