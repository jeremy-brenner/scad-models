$fn=64;
l=25;
r=1.5;

scale([1,1,0.5]) {
  rotate([-90,0,0]) union() {
    sphere(r=r);
    cylinder(r=r,h=l-r*2);
    translate([0,0,l-r*2]) sphere(r=r);
  }

  cylinder(r=r,h=r);
  translate([0,l-r*2,0]) cylinder(r=r,h=r);
  translate([-r,0,0]) cube([r*2,l-r*2,r]);
}