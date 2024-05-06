$fn=64;

difference() {
  translate([0,0,-3]) cylinder(r=8.5,h=7);
  translate([0,0,-3]) cylinder(r=6.5,h=6);
  translate([0,0,-3]) cylinder(r=3,h=8);
  translate([0,10,-17.5]) rotate([90,0,0]) cylinder(r=17.5, h=20);
}