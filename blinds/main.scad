$fn=32;


use <./gear.scad>;
use <./gear_box.scad>;
use <./gear_mounts.scad>;
use <./box.scad>;

assembled();

box();
//intersection() {
//  rotate([180,0,0]) translate([0,10,0]) boxLid();
//  translate([40,-36,0]) cube([67,35,30]);
//}
//translate([43.5,-34,1.5]) motor();


module assembled() {
  rotate([-65,0,0]) translate([0,0,-1.25]) blindGearAssembled();
  translate([0,-6.75,25.5]) rotate([-90,0,0]) rotate([0,0,360/40]) motorGearMountAssembled();
  color("green",0.6) gearBox();
  color("silver") translate([-8,11.5,16]) gearBoxClip();
  translate([54.5,-6.1,12.5]) color("blue",0.6) rotate([0,0,180]) box();
    translate([54.5,-6.1,65]) color("red",0.6) rotate([0,0,180]) boxLid();

  translate([11,-30.1,14.5]) mirror([1,0,0]) motor();
}

module spacer() {
  translate([0,0,5]) difference() {
    cylinder(r=7.5, h=2.5);
    translate([0,0,-0.5]) cylinder(r=4.2, h=7);
  }
}

module blindGearAssembled() {
  blindGearMount();
  rotate([0,0,180]) blindGearMount();
  translate([0,0,9]) gear();
}

