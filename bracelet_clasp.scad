$fn=32;
difference() {
  union() {
    cylinder(r=4.35,h=4.5);
    sphere(r=2);
  }
  translate([0,0,1]) cylinder(r=3.3,h=3.6);
  translate([-50,-100,-5]) cube([100,100,100]);
  translate([0,-1,0]) rotate([-105,0,0]) cylinder(r=0.75,h=10);
  //translate([0,0,0]) sphere(r=1.5);
 // translate([0,0,0.5]) cylinder(r=1.5,h=10);
}