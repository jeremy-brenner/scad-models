
$fn=32;
t=0.4;


translate([-6-5-t*4,0,0]) difference() {
  union() {
    translate([0,5,0]) cylinder(r=5,h=4);
    cube([5,10,4]);
  }
  translate([0,5,1.1]) screw();
}


translate([0,0,6]) rotate([-90,0,0]) difference() {
  union() {
    cylinder(r=6+t*4,h=10);
    translate([-(6+t*4),0,0]) cube([(6+t*4)*2,6,10]);
  }
  translate([0,0,-0.1]) {
    cylinder(r=6,h=10.2);
    translate([-6,0,0]) cube([12,10,10.2]);
  }
}

module screw() {
  cylinder(r1=2, r2=4, h=3);
  translate([0,0,-4]) cylinder(r=2, h=5);
}
