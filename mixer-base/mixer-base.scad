$fn=128;
t=1.2;

r1=124;
r2=103;
d=137;

a1=87;
a2=48;


difference() {
  avo(r1,r2,d,t);
  translate([0,0,-0.1]) {
    
    avo(r1-30,r2-30,d,2.2);
    
    translate([0,-r1+14+t,0]) screwHoles();
    rotate([0,0,a1]) translate([0,-r1+14+t,0]) screwHoles();
    rotate([0,0,-a1]) translate([0,-r1+14+t,0]) screwHoles();

    translate([0,d,0]) {
      rotate([0,0,a2]) translate([0,r2-14-t,0]) screwHoles();
      rotate([0,0,-a2]) translate([0,r2-14-t,0]) screwHoles();
    }
  }
}

translate([0,0,t]) {
difference() {
  avo(r1,r2,d,5);
  translate([0,0,-0.1]) avo(r1-t,r2-t,d,5.2);
}

color("red") difference() {
  avo(r1-30+t,r2-30+t,d,5);
  translate([0,0,-0.1]) avo(r1-30,r2-30,d,5.2);
}


translate([0,-r1+14+t,0]) foot();
rotate([0,0,a1]) translate([0,-r1+14+t,0]) foot();
rotate([0,0,-a1]) translate([0,-r1+14+t,0]) foot();

translate([0,d,0]) {
  rotate([0,0,a2]) translate([0,r2-14-t,0]) foot();
  rotate([0,0,-a2]) translate([0,r2-14-t,0]) foot();
}

}

module screwHoles() {
  translate([17,0,0]) cylinder(r=2,h=2.2);
  translate([-17,0,0]) cylinder(r=2,h=2.2);
}

module foot() {
  color("green") difference() {
    cylinder(r=11+t,h=5);
    translate([0,0,-0.1]) cylinder(r=11,h=5.2);
  }
}

module avo(r1,r2,d,h) {
  hull() {
    cylinder(r=r1,h=h);
    translate([0,d,0]) cylinder(r=r2,h=h);
  }
}