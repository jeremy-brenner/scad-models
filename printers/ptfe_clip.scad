$fn=64;

difference() {
  union() {
difference() {
  union() {
    translate([0,-5,0]) cube([2,10,2]);
    translate([-5,-4,0]) cube([2,8,2]);
    cylinder(r=5,h=2);
  }
  translate([0,0,-1]) {
    cylinder(r=3,h=10);
    translate([-3,0,0]) cylinder(r=1.5,h=10);
    translate([2,-5.5,0]) cube([5,11,10]);
  }
}
translate([2,3.6,0]) difference() {
  cylinder(r=1.4,h=2);
  translate([-10,-5,-1]) cube([10,10,10]);
}

translate([2,-3.6,0]) difference() {
  cylinder(r=1.4,h=2);
  translate([-10,-5,-1]) cube([10,10,10]);
}

translate([-7,-4,0]) cube([2,8,5]);
}
  rotate([0,30,0]) translate([-2,-10,2.4]) cube([20,20,20]);
}