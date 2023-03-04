$fn=32;
tabA=96.5;

liftMotor();

// difference() {
//   translate([-35,-12,0]) cube([70,34,2]);
//   translate([0,0,-0.1]) liftMotorholes(2.2);
// }

module liftMotorHoles(h) {
  translate([0,13,0]) cylinder(r=6.5, h=h);
  rotate([0,0,tabA]) {
    translate([-3.25,23.5+4.5,0]) cylinder(r=2.25,h=h);
    translate([3.25,23.5+4.5,0]) cylinder(r=2.25,h=h);
  }
  rotate([0,0,-tabA]) {
    translate([-3.25,23.5+4.5,0]) cylinder(r=2.25,h=h);
    translate([3.25,23.5+4.5,0]) cylinder(r=2.25,h=h);
  }
}


module tab() {
  translate([0,0,36.5]) difference() {
    translate([0,23.5,0]) difference() {
      hull() {
        translate([-3.25,4.5,0])  cylinder(r=4,h=1.5);
        translate([3.25,4.5,0])  cylinder(r=4,h=1.5);
        translate([-7.25,0,0]) cube([14.5,1,1.5]);
      }
      translate([-3.25,4.5,-0.1])  cylinder(r=2.25,h=1.7);
      translate([3.25,4.5,-0.1])  cylinder(r=2.25,h=1.7);
    }
    translate([0,0,-0.1]) cylinder(r=25,h=2);
  }
}

module liftMotor() {
  translate([0,-13,-38]) {
    color("gray") cylinder(r=25, h=36);
    color("gray") translate([0,0,36]) difference() {
      cylinder(r=25.5, h=2);
      translate([0,0,-0.1]) cylinder(r=25, h=2.2);
    }
    translate([0,13,36]) color("gray") cylinder(r=6, h=4);
    translate([0,13,40]) color("silver") peg();
    color("gray")  rotate([0,0,tabA]) tab();
    color("gray")  rotate([0,0,-tabA]) tab();
    color("black") translate([0,0,6]) intersection() {
      cylinder(r=26.5,h=13);
      translate([-5.75,-100,0]) cube([11.5,100,100]);
    }
  }
}

module peg() {
  difference() {
    difference() {
      cylinder(r=3.75,h=16);
      translate([-50,-100-2.75,1]) cube([100,100,15.1]);
    }
    translate([0,50,9]) rotate([90,0,0]) cylinder(r=1.75,h=100);
  }
}

module adapter() {
  difference() {
    cylinder(r=5.75,h=15);
    translate([0,0,-1]) intersection() {
      cylinder(r=3.75,h=17);
      translate([-50,-2.75,0]) cube([100,100,17]);
    }
    translate([0,50,9]) rotate([90,0,0]) cylinder(r=1.75,h=100);
  }
}