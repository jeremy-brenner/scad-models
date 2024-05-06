module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn*2)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn);
}
