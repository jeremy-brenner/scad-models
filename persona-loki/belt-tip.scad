$fn=32;
t=6;

difference() {
  cylinder(r=18.5,h=t);
  translate([0,0,-1]) cylinder(r=11,h=t+2);
  translate([0,0,2]) cylinder(r=17,h=t-4);
  translate([-50,4,-1]) cube([100,100,100]);
}