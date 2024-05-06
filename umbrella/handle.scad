$fn=64;

difference() {
  cylinder(r=17.5,h=70);
  translate([0,0,-0.1]) cylinder(r=13.25,h=40.1);
  translate([0,0,-0.1]) cylinder(r=7.25,h=60.1);
  translate([0,0,17]) rotate([0,90,0]) cylinder(r=9.75,h=50);
  translate([0,0,35]) rotate([0,-90,0]) {
    cylinder(r=1.25,h=50);
    translate([0,0,15.5]) cylinder(r=2.5,h=50);

   }
}
