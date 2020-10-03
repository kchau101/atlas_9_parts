use <gears/gears.scad>;

dp = 16;         // Diametral Pitch
N = 64;           // Number of Teeth
fw = 0.306;  // Face Width (in)
pa = 14.5;
bore = 0.287; // Bore Diameter (in)
square = 0.308; // Square Width (in)

m = 25.4/dp;
da_metric = 25.4*fw;
b = 25.4*bore;
sq = 25.4* square;

offset = 2.48;
adj = da_metric - offset;

module keyway() {
    union() {
    cylinder(d=0.75*25.4, h=0.408*25.4, $fn=20);
    translate([0,0.375*25.4,0.204*25.4]) {
    cube([0.215*25.4, 0.125*25.4, 0.408*25.4], center=true);
    }
    translate([0,-0.375*25.4,0.204*25.4]) {
    cube([0.215*25.4, 0.125*25.4, 0.408*25.4], center=true);
    }
}
};

module boss() {
    cylinder(d=1.318*25.4, h=0.063*25.4);
};

module sq_keyway() {
    minkowski() {
    cube([sq,sq,20], center=true);
    cylinder(r=0.35, h=adj, $fn=20);
    }
};

module atlas_gear() {
difference() {
union() {
spur_gear(m, N, da_metric, b, pa, 0);

cylinder(r=1.6*25.4,h=adj, $fn=20);
translate([0,0,adj]) {
    boss();
}
}
keyway();
}
}

atlas_gear();