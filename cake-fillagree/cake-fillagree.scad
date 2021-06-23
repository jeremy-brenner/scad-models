use <../modules/filagree-tile.scad>;

c=370;
w=32;
t=0.4;

ew=30;

difference() {
  translate([-2,-ew,0]) cube([c+4,w+ew*2,t]);
  filCube();
}

intersection() {
  filagree();
  filCube();
}

module filCube() {
  translate([0,0,-1]) cube([c,w,3]);
}

module filagree() {
  linear_extrude(height=t) translate([0,-10]) scale([0.266,0.266]) filagreeTile(11,1);
}
