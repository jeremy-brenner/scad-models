
motor();
$fn=32;

module motor() {
  
  difference() {
    cube([37,19,22]);
    translate([11,-10.5,11]) rotate([-90,0,0]) translate([0,0,-0.5]) cylinder(r=3.125,h=39);
  }

  translate([-5,7.5,8.5]) difference() {
    cube([5,4,5]);
    translate([2.5,-0.5,2.5]) rotate([-90,0,0]) cylinder(r=1.5,h=5);
  }
  translate([37,9.5,11]) rotate([0,90,0]) intersection() {
    translate([0,-0.5,0]) cylinder(r=11.5,h=11);
    translate([-11,-9.5,0]) cube([23,18,11]);
  }
  color("silver") translate([48,9,11]) rotate([0,90,0]) intersection() {
    cylinder(r=10,h=9);
    translate([-10,-7.5,0]) cube([20,15,9]);
  }
  color("dimgrey") translate([57,9,11]) rotate([0,90,0]) intersection() {
    union() {
      cylinder(r=10,h=5);
      cylinder(r=5,h=7);
    }
    translate([-10,-7.5,0]) cube([20,15,17]);
  }
  color("silver") translate([64,9,11]) rotate([0,90,0]) cylinder(r=0.5,h=1);
  
  color("white",0.25) translate([62,9,11]) rotate([0,90,0]) {
    cylinder(r=8,h=1);
    translate([-4,9,-23]) cube([8,1,23]);
    translate([-4,-10,-23]) cube([8,1,23]);
    translate([-4,-10,0]) cube([8,20,1]);

  }

  color("white") translate([11, -10.5, 11]) rotate([-90,0,0]) {
    intersection() {
      difference() {
        cylinder(r=3,h=38);
        translate([0,0,-0.5]) cylinder(r=1,h=39);
      }
      translate([-2,-3,0]) cube([4,6,38]);
    }
    translate([0,0,8]) cylinder(r=3,h=22);
  }
}