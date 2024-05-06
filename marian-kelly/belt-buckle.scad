
$fn=32;

// translate([0,0,-0.9]) color("black") cube([600,65,1]);


translate([100,65/2,0]) buckle();


module buckle() {
  scale(0.5) intersection() {
    buckleRaw();
    cylinder( r=200, h=100);
  }
}


module buckleRaw() {
  scale([1,0.7,0.4]) torus(100,15);
  translate([0,0,5]) scale([1,1,0.4]) hull() {
    translate([-20,0,0]) {
      sphere(r=15);
      translate([0,0,-20]) cylinder(r=15,h=20);
    }
    translate([115,0,0]) {
      sphere(r=15);
      translate([0,0,-20]) cylinder(r=15,h=20);
    }
  }
}

module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn*2)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn);
}
