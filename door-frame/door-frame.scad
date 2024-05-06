// color("red") cube([23,1,1]);

topL=35;
middleL=84;
bottomL=42;

fullL=topL+middleL+bottomL;
// fullL=5;

difference() {
  linear_extrude(height=fullL) scale(1.32) import("profile.svg");
  translate([8,0,bottomL]) cube([100,10,middleL]);
}