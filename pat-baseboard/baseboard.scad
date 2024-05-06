
$fn=128;
r=20;


w=sqrt(r^2/2);

difference() {
  o=-1;
  cornerBit(r);
 
  rotate([0,0,-45]) translate([-r*2,o,-1]) cube([r*4,w,200]);
}

module cornerBit(r) {
  rotate_extrude(angle = 90)
    translate([r,0,0]) 
    baseboard2d();
    edgeExtension(r,w+2);
    rotate([0,0,90]) translate([0,w+2,0]) edgeExtension(r,w+2);

}

module edgeExtension(r,w) {
 translate([r,0,0]) rotate([90,0,0]) linear_extrude(height =w) baseboard2d();

}

module flatTest() {
  linear_extrude(height=0.28 * 2) baseboard2d();
}

module baseboard2d() {
  scale(0.832) 
  translate([-25.66,-15.8]) 
  import("baseboard.svg");
}

