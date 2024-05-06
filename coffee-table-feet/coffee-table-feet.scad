

ll=80;
$fn=64;






 translate([0,0,ll]) 

difference() {
  union() {
      color("#FFFFFF") cube([49,49,42]);
      color("#333333") translate([0,0,3]) bars();
      color("#333333") translate([0,0,39]) bars();
  }
  translate([2,2,2]) cube([45,45,40.1]);
  color("green") {
    leavesPlaced();
  }
}


color("#FFFFFF") hull() {
   translate([0,0,ll]) cube([49,49,1]);
   translate([5,5,0]) cube([39,39,1]);
}

color("#FFFFFF") translate([5,5,0]) hull() {
  cube([39,39,1]);
  translate([5,5,-5]) cube([29,29,1]);
}


module leavesPlaced() {
  color("green") {
    translate([0,0.2,0]) leaves();
    translate([0,49.1,0]) leaves();
    translate([-0.1,0,0]) rotate([0,0,90]) leaves();
    translate([48.8,0,0]) rotate([0,0,90]) leaves();
  }
}
module leaves() {
  translate([3,0,0]) rotate([90,0,0]) linear_extrude(height=0.3) scale(0.2) import("CGC3403.svg");
}

module bars() {
scale([1,1,1.5]) intersection() {
 hull() {
   rotate([-90,0,0]) translate([0,0,-5]) cylinder(r=2,h=59);
   rotate([-90,0,0]) translate([49,0,-5]) cylinder(r=2,h=59);
 }
 hull() {
   rotate([0,90,0]) translate([0,0,-5]) cylinder(r=2,h=59);
   rotate([0,90,0]) translate([0,49,-5]) cylinder(r=2,h=59);
 }
}
}