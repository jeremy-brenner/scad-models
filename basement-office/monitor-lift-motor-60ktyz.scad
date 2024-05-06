$fn=32;

er=5;
hr=2.25;
w=60;
hd=50;

liftMotor();

module liftMotorHoles(h) {
  translate([hd/2,hd/2,0]) cylinder(r=hr,h=h);
  translate([-hd/2,hd/2,0]) cylinder(r=hr,h=h);
  translate([hd/2,-hd/2,0]) cylinder(r=hr,h=h);
  translate([-hd/2,-hd/2,0]) cylinder(r=hr,h=h);
}

module liftMotor(r=0) {
  color("silver") rotate([0,0,r]) peg();
  translate([0,0,-61]) color("gray") cylinder(r=30,h=60);
  color("gray") difference() {
    hull() {
      translate([w/2-er,w/2-er,-1]) cylinder(r=er,h=1);
      translate([-w/2+er,w/2-er,-1]) cylinder(r=er,h=1);
      translate([w/2-er,-w/2+er,-1]) cylinder(r=er,h=1);
      translate([-w/2+er,-w/2+er,-1]) cylinder(r=er,h=1);
    }
    translate([0,0,-1.1]) liftMotorHoles(1.2);
  }
}

module peg() {
  difference() {
    difference() {
      cylinder(r=3.75,h=18);
      translate([-50,-100-2.75,3]) cube([100,100,15.1]);
    }
    translate([0,50,10.5]) rotate([90,0,0]) cylinder(r=1.75,h=100);
  }
}
