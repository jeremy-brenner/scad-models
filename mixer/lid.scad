$fn=128;

t=1.6;

difference() {
union() {
  difference() {
    union() {
      cylinder(r=125,h=t);
      translate([0,0,t]) cylinder(r1=115,r2=110,h=5+t);
    }
    translate([0,0,-0.1]) cylinder(r1=114.75,r2=109.75,h=5+t);
  }

  difference() {
    cylinder(r=125+t,h=5+t*2);
    translate([0,0,-0.1]) cylinder(r=125,h=5.2+t*2);
  }
}
// translate([0,0,-0.1]) cube([1000,1000,1000]);
}