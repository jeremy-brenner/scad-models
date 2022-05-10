$fn=32;

difference() {
  ring();
  translate([-50,-50,-100]) cube([100,100,100]);
 
}

module ring() {
  rot=17;
  bigR=9;
  smallR=2;
  rotate([0,0,rot]) half(bigR,smallR); 
  rotate([0,0,-rot]) mirror([1,0,0]) half(bigR,smallR); 
}

module half(bigR,smallR) {
  difference() {
    torus(bigR, smallR);
    translate([0,-50,-50]) cube([100,100,100]);
  }
  translate([0,bigR,0]) sphere(r=smallR);
}


module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn);
}
