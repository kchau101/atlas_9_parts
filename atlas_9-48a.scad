use <gears/gears.scad>;

dp = 12;         // Diametral Pitch
N = 18;           // Number of Teeth
tooth_width = 0.350;  // Tooth Width (in)
pa = 14.5;
bore = 0.628; // Bore Diameter (in)

m = 25.4/dp;
b = 25.4*bore;
tw = 25.4*tooth_width;

module dog_tooth() {
    p1 = [-2.91, 3.70];
    p2 = [0, 3.850];
    p3 = [2.91, 3.70];
    p4 = [2.20, -0.10];
    p5 = [0, 0];
    p6 = [-2.20, -0.10];
    extrude_height = 4.52;
    
    translate([0,8,0]) {
        linear_extrude(height = extrude_height) {
            polygon([p1, p2, p3, p4, p5, p6]);
        };
    };
};

module dog_clutch(s=1) {
    for (i=[0, 60, 120, 180, 240, 300, 360]) {
        rotate(i) {
            scale(s) {
                dog_tooth();
            };
        };
    };
};


module atlas_9_48a(fn=15) {
    difference() {
        difference() {
            union() {
                bevel_gear(m, N,  45, tw, b, pressure_angle=pa, helix_angle=0);
                translate([0,0,5.5]) {
                    cylinder(d=24, h=1.5, $fn=fn);
                };

                translate([0,0,-12.25]) {
                    cylinder(d=31.25, h=12.25, $fn=fn);
                };
                
                translate([0,0,-25]) {
                    cylinder(d=22, h=12.75, $fn=fn);
                };

                translate([0,0,-28.2]) {
                    cylinder(d=29.66, h=3.20, $fn=fn);
                };
            };
            translate([0,0,2.75]) {
                dog_clutch(0.97);
            };
            cylinder(d=16,h=70, center=true, $fn=fn);
        };
        
        translate([0,0,7]) {
            cylinder(d=40 ,h=10, $fn=fn);
        };
        
        translate([0,0,-18])
        rotate([90,0,90]){
            cylinder(d=4.75,h=60, center=true, $fn=fn);
        }
    };
};

atlas_9_48a(40);