use <chain-mount.scad>;


$fn=32;

screwDistance=30.5;

chainMountWidth=24.5;



rotate([180,0,0]) {
  translate([20-3.25,-14.75,-6]) {
    difference() {
    
    rotate_extrude(convexity = 10) translate([30, 0, 0]) cableU();
    rotate([0,0,90]) translate([-500,0,-500]) cube([1000,1000,1000]);
    rotate([0,0,-155]) translate([-500,0,-500]) cube([1000,1000,1000]);

    rotate([0,0,45]) translate([-500,-2,-4]) cube([1000,4,2]);
  }
    
    translate([-20,30,0]) difference() {
      rotate([90,0,90]) linear_extrude(height=20) cableU();
      translate([2,-500,-4]) cube([4,1000,2]);
    }
  }
  
  difference() {
    union() {
      top();
      screwPlacement() cylinder(r=3.5,h=34);
    }
    screwPlacement() screwHole();
    screwPlacement() translate([0,0,33]) cylinder(r1=1.6,r2=2,h=1.1);
    translate([-3,15,18]) rotate([0,-90,0]) honeyComb(4.5,9);
    translate([39,15,18]) rotate([0,-90,0]) honeyComb(4.5,9);
  }

  translate([-8.25,chainMountWidth/2+screwDistance/2,0]) rotate([0,90,0]) chainMount();
}

module top() {
  d=5;
  difference() {
    hull() screwPlacement() cylinder(r=5.75, h=34);
    translate([d/2,-10,5]) cube([screwDistance-d,100,30]);
    translate([-4,d/2,5]) cube([screwDistance+8,screwDistance-d,30]);
  }
}

module screwHole() {
  translate([0,0,-0.01]) cylinder(r1=3.25,r2=1.6,h=2.21);
  translate([0,0,2]) cylinder(r=1.6,h=100);
}

module screwPlacement() {
  children();      
  translate([screwDistance,0,0]) children();
  translate([0,screwDistance,0]) children();
  translate([screwDistance,screwDistance,0]) children();
}

module cableU() {
  difference() {
      union() {
        circle(r = 6.5);
        translate([-6.5,-5.5]) square([13,5.5]);
      }
      circle(r = 5);
      translate([-5,-20]) square([10,20]);
    }
}

module honeyComb(hr,hd) {
    cylinder(r=hr,h=5,$fn=6);
    translate([0,hd,0]) cylinder(r=hr,h=5,$fn=6);
    rotate([0,0,60]) translate([0,hd,0]) cylinder(r=hr,h=5,$fn=6);
    rotate([0,0,120]) translate([0,hd,0]) cylinder(r=hr,h=5,$fn=6);
    rotate([0,0,180]) translate([0,hd,0]) cylinder(r=hr,h=5,$fn=6);
    rotate([0,0,240]) translate([0,hd,0]) cylinder(r=hr,h=5,$fn=6);
    rotate([0,0,300]) translate([0,hd,0]) cylinder(r=hr,h=5,$fn=6);
}
