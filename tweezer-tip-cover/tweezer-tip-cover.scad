$fn=32;

a=3.8;

difference() {

hull() {
  translate([0,0,-0.15]) cylinder(r=1.5,h=1);
  rotate([-a,0,0]) cylinder(r1=1.5,r2=2.5,h=13);
  rotate([a,0,0]) cylinder(r1=1.5,r2=2.5,h=13);
  translate([0,1,13]) cylinder(r=2.5,h=2);
  translate([0,-1,13]) cylinder(r=2.5,h=2);

}

translate([0,0,1]) hull() {
  rotate([-a,0,0]) cylinder(r1=0.5,r2=1.5,h=12.5);
  rotate([a,0,0]) cylinder(r1=0.5,r2=1.5,h=12.5);
  translate([0,1,12.5]) cylinder(r=1.5,h=2);
  translate([0,-1,12.5]) cylinder(r=1.5,h=2);
}

}