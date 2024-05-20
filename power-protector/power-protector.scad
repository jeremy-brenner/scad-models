$fn=128;


translate([13,0,15]) rotate([0,90,0]) rotate([0,0,90]) ear();
mirror([1,0,0]) translate([13,0,15]) rotate([0,90,0]) rotate([0,0,90]) ear();

difference() {
  body();
  translate([0,-0.5,-1]) plug();
}


module ear() {
  difference() {
    translate([0,0,-1]) union() {
      cylinder(r=5,h=6);
      translate([-5,-20,0]) cube([10,20,6]);
    }
     translate([0,0,6]) rotate([32,0,0]) translate([-10,-50,0]) cube([20,50,20]);
     translate([0,0,2]) rotate_extrude(angle=180)
  translate([5,0])
  circle(r=2);
  translate([5,0,2]) rotate([90,0,0]) translate([0,0,-0.1]) cylinder(r=2,h=10);
  translate([-5,0,2]) rotate([90,0,0]) translate([0,0,-0.1]) cylinder(r=2,h=10);

  }
}

module body() {
  h=20;
  union() {
    translate([0,0,h]) scale([1,1,0.5]) sphere(d=26);
    cylinder(d=26,h=h);
  }
}

 
module plug() {
  translate([0,1,0]) {
    prong();
    mirror([1,0,0]) prong();
  }
  translate([0,-7,0]) ground();
}

module prong() {
  translate([5.5,0,0]) cube([2,7,19]);
}

module ground() {
  cylinder(d=5.5, h=23.5);
}