include <./snap_clip.scad>;

module gearBoxClip() {
  gearBoxClipHalf();
  rotate([25,0,0]) mirror([0,0,1]) gearBoxClipHalf();
}

module gearBoxClipHalf() {
  difference() {
    union() {
      cube([16,1.5,5]);
      snapClip(6);
      translate([16,0,0]) mirror([1,0,0]) snapClip(6);
    }
    rotate([25/2,0,0]) translate([-50,-50,-10]) cube([100,100,10]);
    rotate([25/2,0,0]) translate([-50,-50,4.5]) cube([100,100,10]);
  }
}

module gearBoxHalf() {
  difference() {
    gearBox();
    translate([0,-50,-50]) cube([100,100,100]);
  }
}

module gearBox() {
  
  difference() {
    gearCase();
    translate([6,-6,18])union() {
      cube([2,2,15]);
      translate([-1,1.75,0]) cube([3,1,15]);
    }
    mirror([1,0,0]) translate([6,-6,18])union() {
      cube([2,2,15]);
      translate([-1,1.75,0]) cube([3,1,15]);
    }
  }
  
  translate([0,-5.65,25.4]) rotate([25,0,0]) rotate([0,180,0]) gearCase();
}

module gearCase() {
  difference() {
    translate([0,2.75,8.5]) {
      difference() {
        arch(17,9);
        translate([0,0,2]) arch(14,9.5);
        translate([0,9,17]) rotate([90,0,0]) cylinder(r=4.2, h=18);
      }
      translate([0,12.5,17]) rotate([90,0,0]) spacer();
    }
    translate([6,7,10.5]) cube([2,5,10]);
    translate([-8,7,10.5]) cube([2,5,10]);
   
    rotate([25/2,0,0]) translate([-25,-25,-37]) cube([50,50,50]);
  }
}

module arch(h,ir) hull() {
  translate([0,0,h]) rotate([90,0,0]) {
    rotate_extrude(convexity = 10)
      translate([ir, 0, 0])
      circle(r = h/2);
    translate([0,0,-h/2]) cylinder(r=ir,h=h);
  }
  translate([ir,0,0]) cylinder(r=h/2,h=h);
  translate([-ir,0,0]) cylinder(r=h/2,h=h);
  translate([-ir,-h/2,0]) cube([ir*2,h,h]);
}
