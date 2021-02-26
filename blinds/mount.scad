
$fn=32;

main();

module main() {
  w = 18;

  cube([33,w,4]);
  translate([5,0,8]) rotate([0,5,0]) cube([28,w,2]);
  translate([29,0,0]) cube([4,w,16]);
  translate([29,0,12]) cube([11,w,4]);
  translate([36,0,10]) cube([4,w,6]);
  cube([4,w,43]);
  mountPlate(w);
  translate([0,0,36]) top(w);
}

module top(w) {   
  translate([0,0,3]) cube([11,w,4]);
  translate([3,0,0]) cube([4,w,7]);
  difference() {
    translate([7,0,1]) cube([4,w,6]);
    translate([8,-0.5,1]) rotate([-90,0,0]) cylinder(r=1,h=w+1);
  }
  translate([10,0,1]) rotate([-90,0,0]) cylinder(r=1,h=w);
}

module mountPlate(w) {
  translate([0,-11,0]) {
    difference() {
      cube([4,40,20]);
      translate([-0.5,5,12]) rotate([0,90,0]) cylinder(r=2,h=5);
      translate([-0.5,35,12]) rotate([0,90,0]) cylinder(r=2,h=5);
    }
  }
}