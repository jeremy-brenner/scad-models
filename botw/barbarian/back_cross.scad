//cylinder(r=30,h=5,$fn=8);

r=30;

// difference() {
//   cross(6);
//   translate([0,0,-1]) cylinder(r=r-2,h=5);
// }


intersection() {
  cross(2);
  translate([0,0,-1]) cylinder(r=r-2.1,h=5);
}


module cross(t) {
  arm(t);
  rotate([0,0,90]) arm(t);
  rotate([0,0,180]) arm(t);
  rotate([0,0,270]) arm(t);
}


module arm(t) {
  w=30;
  o=3;
  intersection() {
    rotate([0,0,10]) translate([-o,0,0]) cube([w,r,t]);
    rotate([0,0,-10]) translate([-w+o,0,0]) cube([w,r,t]);
  }
}
