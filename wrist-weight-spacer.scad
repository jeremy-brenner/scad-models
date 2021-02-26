$fn=32;

difference() {
  union() {
    cylinder(r=3,h=10);
    translate([0,14,0]) cylinder(r=3,h=10);
    translate([-3,0,0]) cube([6,14,10]);
  }
  translate([-1,0,-0.5]) cube([2,14,11]);
  translate([-1,0,-0.5]) cube([10,2,11]);
}