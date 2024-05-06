t=1.2;
$fn=64;

difference() {
  cube([80+t*2,125+t,20+t*2]);
  translate([t,t,t]) cube([80,125.1,20]);
}
translate([80/2+t,t,t]) rotate([-90,0,0]) cylinder(r=t,h=125);
translate([80/2+t,t,t+20]) rotate([-90,0,0]) cylinder(r=t,h=125);