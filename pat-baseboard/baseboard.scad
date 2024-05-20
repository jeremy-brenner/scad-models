
$fn=128;

r=20;
trim=1;

w=sqrt(r^2/2);

// flatTest();

// difference() {
intersection() {
  o=-1;
  cornerBit(r);
 rotate([0,0,-45]) translate([-100,o+w,-1]) cube([200,50,200]);

}
//color("green") rotate([0,0,-45]) translate([0,r+5,-0.1]) mirror([1,0,0]) linear_extrude(height=2) text(text=str(trim, "mm"),size=4 ,valign = "center",halign = "center"); 

//}

module cornerBit(r) {
  rotate_extrude(angle = 90)
    translate([r,0,0]) 
    baseboard2d();
    edgeExtension(r,50);
    rotate([0,0,90]) translate([0,50,0]) edgeExtension(r,50);

}

module edgeExtension(r,w) {
 translate([r,0,0]) rotate([90,0,0]) linear_extrude(height =w) baseboard2d();

}

module flatTest() {
  linear_extrude(height=0.28 * 2) baseboard2d();
}

module baseboard2d() {
  intersection() {
    translate([-trim,0,0]) scale(0.832) 
      translate([-25.66,-15.8]) 
      import("baseboard.svg");
    square([200,200]);
  }
}

