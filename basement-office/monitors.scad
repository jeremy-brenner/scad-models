module omenMonitor() {
  translate([560/-2,0,0]) {
    color("#202020") hull() {
      cube([560, 20, 330]);
      translate([560/2,20,330/2]) scale([6,1,3.5]) difference() {
        sphere(r=40);
        translate([-40,-40,-40]) cube([80,40,80]);
      }
    }
    color("#A0A0F0") translate([3,-0.1,25])  cube([560-6, 0.1, 330-28]);
  }
}

module dellMonitor() {
  translate([570/-2,0,0]) {
    color("#202020") hull() {      
      translate([10,20,10]) rotate([90,0,0]) cylinder(r=10,h=20);
      translate([560,20,10]) rotate([90,0,0]) cylinder(r=10,h=20);
      translate([10,20,330]) rotate([90,0,0]) cylinder(r=10,h=20);
      translate([560,20,330]) rotate([90,0,0]) cylinder(r=10,h=20);
      translate([570/2,20,340/2]) scale([6,1,3.5]) difference() {
        sphere(r=40);
        translate([-40,-40,-40]) cube([80,40,80]);
      }
    }
    color("#A0A0F0") translate([20,-0.1,20])  cube([570-40, 0.1, 340-40]);
  }
}