use <./medal.scad>;
use <./medal_clip.scad>;
use <./medal_belt_clip.scad>;
use <./belt_hang_clip.scad>;

use <./buckle.scad>;



medalOffset=100;
clipL=15;

translate([-26, -medalOffset, 1]) medalGroup();
translate([-26, medalOffset, 1]) medalGroup();
translate([0,-43.75,0]) buckle();
belt();
beltHangClip();

module medalGroup() {
  rotate([0,0,-90]) medal();
  translate([21.75,0,5]) medalClip(clipL);
  translate([37,0,0]) medalBeltClip();
}

module belt() {
  translate([0,-250,0]) color("#77363c") cube([50,500,1]);
}