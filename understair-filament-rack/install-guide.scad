
union() {
difference() {
  cube([204,154,5]);
  translate([4,4,-0.1]) cube([196,146,5.2]);
}

intersection() {
  cube([204,154,5]);
  union() {
    translate([30,0,0]) rotate([0,0,45]) cube([2,100,5]);
    translate([0,150-30,0]) rotate([0,0,-45]) cube([2,100,5]);

    translate([204-30,0,0]) rotate([0,0,-45]) cube([2,100,5]);
    translate([204,150-30,0]) rotate([0,0,45]) cube([2,100,5]);
  }
}

rotate([0,0,90]) mirror([0,1,0]) translate([10,-9,0]) {
  cylinder(r=6.15,h=5);
  translate([-4,4.15,0]) cube([8,5,5]);
}
}