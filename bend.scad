difference() {
  u(40,10,20);
  u(40,8,21);
  translate([-50,-50,0]) cube([50*2,100,10]);
}


difference() {
difference() {
  cylinder(r=40+10,h=10);
  translate([0,0,-0.1]) cylinder(r=40-10,h=10.2);
}

translate([0,0,-0.1]) difference() {
  cylinder(r=40+8,h=10.2);
  translate([0,0,-0.1]) cylinder(r=40-8,h=10.4);
}
  translate([-50,0,-0.1]) cube([50*2,100,10.2]);

}

translate([30,0,0]) difference() {
  cube([20,20,10]);
  translate([2,0,-0.1]) cube([16,21,10.2]);
}


translate([-50,0,0]) difference() {
  cube([20,20,10]);
  translate([2,0,-0.1]) cube([16,21,10.2]);
}


module u(r1,r2,h) {
  difference() {
    torus(r1,r2);
    translate([-(r1+r2),0,-r2]) cube([(r1+r2)*2,(r1+r2),r2*2]);
  }
  translate([r1,0,0]) rotate([-90,0,0]) cylinder(r=r2,h=h);
  translate([-r1,0,0]) rotate([-90,0,0]) cylinder(r=r2,h=h);

}

module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn);
}
