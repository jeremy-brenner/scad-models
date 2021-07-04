$fn=32;

color("gray") cylinder(r=21,h=2);

translate([0,0,2]) color("lightgray") {
  translate([0,0,0.5]) decoration();
  linear_extrude(height = 0.5) projection(cut = false) decoration();
}
//projection(cut=false) decoration():


module decoration() {
  translate([0,0,-0.75]) difference() {
    scale([1,1,0.5]) {
        sr=23;
        rotate([0,0,sr]) translate([0,9,1.5]) sphere(r=2);
        rotate([0,0,-sr]) translate([0,9,1.5]) sphere(r=2);
        rotate([0,0,sr]) translate([0,-9,1.5]) sphere(r=2);
        rotate([0,0,-sr]) translate([0,-9,1.5]) sphere(r=2);
        translate([0,0,1.5]) torus(19,2);
        difference() {
            union() {
                translate([3.5,37/2,1.5]) rotate([90,0,0]) cylinder(r=2,h=37);
                translate([-3.5,37/2,1.5]) rotate([90,0,0]) cylinder(r=2,h=37);    
            }
            cylinder(r=9,h=10);
        }
        difference() {
            translate([0,0,1.5]) torus(9,2);
            rotate([0,0,23]) translate([0,-10,0]) cube([30,30,20]);
            rotate([0,0,-23]) translate([0,-20,0]) cube([30,30,20]);
        }

        rotate([0,0,180]) difference() {
            translate([0,0,1.5]) torus(9,2);
            rotate([0,0,23]) translate([0,-10,0]) cube([30,30,20]);
            rotate([0,0,-23]) translate([0,-20,0]) cube([30,30,20]);
        }
        translate([0,0,1.74]) scale([1,1,0.5]) sphere(r=3.5);
    }
    translate([0,0,-1]) cylinder(r=21,h=1.75);
    }
}

// color("lightgray") {
//   difference() {
//     cylinder(r=20,h=3);
//     cylinder(r=17,h=4);
//   }
//   difference() {
//     union() {
//       translate([-4.5,-38/2,0]) cube([9,38,3]);
//       cylinder(r=10,h=3);
//     }
//     translate([-1.5,-38/2,0]) cube([3,38,4]);
//     cylinder(r=7,h=4);
//   }
//   cylinder(r=3.5,h=3);
// }

module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn);
}
