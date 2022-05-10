

$fn=32;

//translate([2,-10,0]) color("red") cube([91,20,4]);


ear();
translate([0,-10,4]) cube([95,20,4]);
translate([95,0,0]) rotate([0,0,180]) ear();

module ear() {
  translate([-10,0,0]) {
    difference() {
      union() {
        cylinder(r=10,h=4);
        translate([0,-10,0]) cube([10,20,4]);
      }
      translate([0,0,-0.1]) cylinder(r1=2.5, r2=5, h=4.2);
    }
    translate([10,10,2]) rotate([90,0,0]) cylinder(r=2,h=20); 
    translate([10,-10,2]) cube([2,20,2]);
    translate([6,-10,4]) difference() {
      cube([6,20,2]);
      translate([0,-1,2]) rotate([-90,0,0]) cylinder(r=2,h=22);
    }
    translate([10,-10,6]) rotate([-90,0,0]) cylinder(r=2,h=20);
  }
}


