$fn=32;

w=80;
hd=71.5;
o=(80-71.5)/2;

difference() {
  cube([w,w,10]);
  translate([o,o,-0.1]) cylinder(r=1.5,h=10.2);
  translate([hd+o,o,-0.1]) cylinder(r=1.5,h=10.2);
  translate([hd+o,hd+o,-0.1]) cylinder(r=1.5,h=10.2);
  translate([o,hd+o,-0.1]) cylinder(r=1.5,h=10.2);
  translate([w/2,w/2,-0.1]) cylinder(r=w/2-1,h=10.2);
}