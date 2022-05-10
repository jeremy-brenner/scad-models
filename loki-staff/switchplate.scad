lw=0.4;
wt=lw*3;


difference() {
  cube([15,20,15]);
  translate([wt,-1,-wt]) cube([15-wt*2,22,15]);
  translate([15/2-2.5/2,10,0]) cube([2.5,20,20]);
  translate([15/2-9/2,20/2-15.25/2,0]) cube([9,15.25,20]);
}