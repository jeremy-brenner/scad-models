include <./mario-star.scad>

translate([0,0,14]) doorEye();
// doorStar();


module doorStar() {
  difference() {
    intersection() {
      scale([1,1,0.435]) star(5,28,12,95,false);
      translate([-500,0,-1]) cube([1000,1000,100]);
    }
    translate([15,20,8.2]) scale([1,0.75,1]) cylinder(r=7.2,h=14);
  }
}

module doorEye() {
  color("#333333") {
    translate([0,20,0]) {
      difference() {
        translate([0,0,17.2]) hull() {
          translate([0,0,0]) sphere(r=7);
          translate([30,0,0]) sphere(r=7);
        }
        scale([1.5,1,1]) translate([1,10,6]) rotate([90,0,0]) cylinder(r=7,h=20);
        translate([27,0,0]) scale([1.5,1,1]) translate([1,10,6]) rotate([90,0,0]) cylinder(r=7,h=20);

      }
      translate([15,0,4]) scale([1,0.75,1.5]) difference() {
        translate([0,0,-7]) cylinder(r=7,h=14);
        torus(11,7);
      }
    }

  }
}

module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn);
}
