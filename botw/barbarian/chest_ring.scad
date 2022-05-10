$fn=64;

chestRing();

module chestRing() {
  difference() {
    torus(30, 7);
    translate([-50,-50,-100]) cube([100,100,100]);
  }
}

module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn);
}
