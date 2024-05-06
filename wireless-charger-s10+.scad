$fn=64;
cr=5.5;
cl=163;
cw=79;

difference() {
  translate([0,0,7]) cube([cl+1.6*2, cw+1.6*2,13.9], center=true);
  union() {
    phone();
    translate([50, -6, 5]) cube([46,12,12.1]);
    cylinder(r=50.5,h=12.1);
  }
  translate([-500,-500,0]) cube([1000,1000,2]);
}

// translate([50, 0, 6]) translate([0,0,0]) color("red") cylinder(r=5,h=9);

module phone() {
  hull() {
    translate([-cl/2+cr,cw/2-cr,0]) sphere(r=cr);
    translate([cl/2-cr,cw/2-cr,0]) sphere(r=cr);
    translate([-cl/2+cr,-cw/2+cr,0]) sphere(r=cr);
    translate([cl/2-cr,-cw/2+cr,0]) sphere(r=cr);
  }
}