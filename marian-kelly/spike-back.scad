postH=4;
postD=27;
$fn=32;

translate([postD/2,0,1.2]) post();
translate([-postD/2,0,1.2]) post();

hull() {
  translate([postD/2,0,0]) cylinder(r=10,h=1.2);
  translate([-postD/2,0,0]) cylinder(r=10,h=1.2);
}

module post() {
  hull() {
    translate([0,2,-0.1]) cylinder(r=2.25, h=postH);
    translate([0,-2,-0.1]) cylinder(r=2.25, h=postH);
  }
}