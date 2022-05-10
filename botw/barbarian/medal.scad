$fn=64;


module medal() {
  scale([1.4,1.4,1.4]) {
    translate([0,0,1.5]) color("lightgray") medalDecoration();
    color("gray") medalBase();
  }
}

module medalBase() {
  difference() {
    cylinder(r=21,h=2);
    translate([0,15.5,-1]) cylinder(r=1.4,h=10);
    translate([0,0,1.5]) {
      linear_extrude(height = 0.6) offset(r = 0.2) projection(cut = false) decoration();
      difference() {
        cylinder(r=30,h=0.6);
        cylinder(r=20,h=0.6);
      }
    }
  }
}

module medalDecoration() {
  translate([0,0,0.5]) decoration();
  linear_extrude(height = 0.5) projection(cut = false) decoration();
}




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


module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn);
}

