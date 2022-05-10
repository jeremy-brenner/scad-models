$fn=64;

difference() {
  union() {
    cube([24,24,5]);
    translate([4,2,5]) cube([20,20,3]);
  }

  translate([7.5,4.5,-0.1]) cylinder(r=1.5,h=8.2);
  translate([7.5,19.5,-0.1]) cylinder(r=1.5,h=8.2);
  translate([11.5,12,-0.1]) cylinder(r=2.5,h=2.7);
  translate([11.5,12,2.5]) cylinder(r1=2.5,r2=3.5,h=2.51);

  translate([10,4,5]) cube([12,16,3.1]);
  translate([6,7,5]) cube([4.1,10,3.1]);

}