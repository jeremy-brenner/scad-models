$fn=64;
r=59.5/2;

difference() {
  cylinder(r=r+1,h=11);
  translate([0,0,1]) cylinder(r=r,h=10.1);
}