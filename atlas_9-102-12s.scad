use <gears/gears.scad>;

dp = 16;         // Diametral Pitch
N = 12;           // Number of Teeth
fw = 0.306;  // Face Width (in)
pa = 14.5;
bore = 0.287; // Bore Diameter (in)
square = 0.307; // Square Width (in)

m = 25.4/dp;
da_metric = 25.4*fw;
b = 25.4*bore;
sq = 25.4* square;

difference() {
spur_gear(m, N, da_metric, b, pa, 0);
minkowski() {
    cube([sq,sq,20], center=true);
    cylinder(r=0.35, h=2, $fn=20);
    }
}