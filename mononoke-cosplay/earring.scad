$fn = $preview ? 64 : 128;


//translate([0,0,20]) rotate([0,90,0]) torus(r1=11.5, r2=1.5);

//intersection() {
   earring();
//  translate([0,0,19]) rotate([0,90,0]) cylinder(r=15,h=2.2);
//}

module earring() {
  difference() {
    scale([0.2,0.9,1]) sphere(r=30);
    translate([-100,-50,-50]) cube([100,100,100]);
    translate([-20,0,35]) rotate([0,90,0]) cylinder(r=12.25,h=50);
    translate([0,0,19]) rotate([0,90,0]) torus(r1=11.25, r2=2);
  }
}

module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn/2)
    translate([r1, 0, 0])
    scale([0.5,1,1])
    circle(r = r2, $fn=$fn/4);
}