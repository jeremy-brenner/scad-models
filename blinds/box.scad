include <./motor.scad>;
include <./snap_clip.scad>;

module box() {
  boxWithMount();
  translate([47.5,0,6]) {
    mirror([0,1,0]) snapClip(14.5);
    translate([14,0,0]) mirror([1,0,0]) mirror([0,1,0]) snapClip(14.5);
  }
}

module boxLid() mirror([0,0,1]) {
  difference() {
    boxWithMount();
    translate([-1,-1,2]) cube([50.6,3,100]);
    translate([59.4,-1,2]) cube([100,3,100]);
    translate([-1,-1,2]) cube([3,50,100]);
    translate([-1,34,2]) cube([120,3,100]);
    translate([109,-1,2]) cube([100,100,100]);
  }
  translate([1.5,1.5,0]) difference() {
    cube([109,33,5.5]);
    translate([1,1,-0.5]) cube([107,31,11]);
  }
  translate([1.5,22,4.5]) rotate([90,0,0]) cylinder(r=1,h=8);
  translate([110.5,22,4.5]) rotate([90,0,0]) cylinder(r=1,h=8);

}

module boxWithMount() {
  h=22;
  w=33;
  l=109;
  t=1.5;
  difference() {
    cube([l+t*2,w+t*2,h+t]);
    translate([t,t,t]) cube([l,w,h+2.5]);
    translate([54.5,5,13]) rotate([90,0,0]) cylinder(r=5,h=10);
    translate([49.5,-1,13]) cube([10,10,15.5]);
    translate([-1,14,4]) cube([10,8,4]);
    translate([-0.5,13.5,19.5]) cube([4,9,2]);
    translate([110,13.5,19.5]) cube([4,9,2]);
  }
  translate([42.5,4,1.5]) motorMount();
}

module motorMount() color("orange") difference() {
  union() {
    cube([1,20,6]);
    
    translate([63,0,0]) difference() {
        cube([1,20,6]);
        translate([-0.5,11,11]) rotate([0,90,0]) cylinder(r=8,h=2);
    }

    translate([0,20,0]) cube([64,1,6]);
    translate([0,0,0]) cube([64,1,6]);

    translate([37.75,0,0]) difference() {
      cube([25.5,20,6]);
      translate([-0.5,11,11]) rotate([0,90,0]) {
        cylinder(r=11.5,h=12);
        translate([0,0,11]) cylinder(r=10,h=15.5);
      }
    }
  } 
  translate([59.5,15,6]) rotate([-90,0,0]) cylinder(r=2.5,h=10);
}


