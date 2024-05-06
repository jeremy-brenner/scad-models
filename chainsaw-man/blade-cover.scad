h=200;
$fn=64;

cube([20,30,0.8]);

// rotate_extrude(convexity = 10, angle = 180, $fn=$fn) projection(cut=false) translate([-115/2,0,0]) rotate([0,0,90]) shape();

// shape();

module shape() {
difference() {
  union() {
    translate([0,0,0]) cube([27.4,16.2,h]);
    translate([8.5,14,0]) cube([10.4,32.2,h]);
    translate([13.7,32.2+14,0]) cylinder(r=5.2,h=h);
  }
  translate([1.2,0,-0.1]) negative();
}
}

module negative() {
  translate([2,-0.1,0]) cube([21,2.1,h+0.2]);
  translate([0,1.2,0]) cube([25,13.8,h+0.2]);
  translate([8.5,14.9,0]) cube([8,31.1,h+0.2]);
  translate([12.5,31.1+14.9,0]) cylinder(r=4,h=h+0.2);
}