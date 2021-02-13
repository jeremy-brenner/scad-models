$fn=64;

difference() {
  union() {
    bracket();
    translate([0,-5,12]) rotate([0,90,0]) cylinder(r=6,h=8);
    translate([0,-5,6]) cube([4,173,12]);
    translate([0,168,12]) rotate([0,90,0]) cylinder(r=6,h=8);
    translate([0,150,0]) bracket();
  }
  translate([-0.01,-5,12]) rotate([0,90,0]) cylinder(r=2.5, h=5.02);
  translate([-0.01,168,12]) rotate([0,90,0]) cylinder(r=2.5, h=5.02);

  translate([5,-5,12]) rotate([0,90,0]) cylinder(r1=2.5, r2=5, h=5.02);
  translate([5,168,12]) rotate([0,90,0]) cylinder(r1=2.5, r2=5, h=5.02);
}

module bracket() difference() {
   cube([17,13,24]);
   translate([7,4,4]) cube([11,5,21]);
}