$fn=32;
r1=12;

color("silver") {
 // beltHangClip();
  translate([0,0,-11]) beltHangClipBack();
}
module beltHangClip() {
  difference() {
    scale([1,1,0.5]) rotate([90,0,0]) torus(r1,5);
    translate([0,0,-50]) cylinder(r=50,h=50);
  }
  translate([r1,0,-6]) post();
  translate([-r1,0,-6]) post();
}

module beltHangClipBack() {

    difference() {    
      union() {
        translate([r1,0,0]) cylinder(r=5,h=2);
        translate([-r1,0,0]) cylinder(r=5,h=2);
        translate([r1,0,2]) cylinder(r1=5,r2=3.125,h=2);
        translate([-r1,0,2]) cylinder(r1=5,r2=3.125,h=2);
        translate([-r1,-3,0]) cube([r1*2,6,2]);
      }
      translate([r1,0,-0.1]) cylinder(r=1.75,h=8.2);
      translate([-r1,0,-0.1]) cylinder(r=1.75,h=8.2);

      translate([-r1,0,-0.1]) cylinder(r=3,h=1.6);
      translate([r1,0,-0.1]) cylinder(r=3,h=1.6);

    }

}

module post() {
  difference() {
    union() {
      cylinder(r=3.125,h=6);
      translate([0,0,4]) cylinder(r1=3.125,r2=5,h=2);
    }
    translate([0,0,-0.5]) cylinder(r=1.49,h=10);
  }
}

module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn);
}
