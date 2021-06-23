$fn=128;
r=60;
t=3;

cylinder(r=r,h=t);
translate([0,-r,0]) cube([r,r*2,t]);
translate([r,-r,0]) cube([t,r*2,10]);