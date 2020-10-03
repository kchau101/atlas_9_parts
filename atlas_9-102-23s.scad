use <gears/gears.scad>;

dp = 16;         // Diametral Pitch
N = 23;           // Number of Teeth
fw = 0.306;  // Face Width (in)
pa = 14.5;
bore = 0.287; // Bore Diameter (in)
square = 0.308; // Square Width (in)

m = 25.4/dp;
da_metric = 25.4*fw;
b = 25.4*bore;
sq = 25.4* square;

offset = 1.57;
adj = da_metric - offset;

difference() {
union() {
spur_gear(m, N, da_metric, b, pa, 0);

cylinder(r=0.56*25.4,h=adj, $fn=20);
}
minkowski() {
    cube([sq,sq,20], center=true);
    cylinder(r=0.35, h=adj, $fn=20);
    }
}