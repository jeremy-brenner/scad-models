$fn=64;
// h=120;
h=20 ;

difference() {
  cylinder(r=38,h=h);
  translate([0,0,-0.1]) cylinder(r=30,h=2.2);
  translate([0,0,2]) cylinder(r=38-1.2,h=120);
}

translate([0,0,20]) difference() {
  cylinder(r=38,h=2);
  translate([0,0,-0.1]) cylinder(r=24,h=2.2);
}