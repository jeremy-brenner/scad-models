$fn=128;


t=1.68;

difference() {
  translate([1.25,1.25,0]) base();
  translate([2,1.75,-0.5]) cube([13,2.25,t+1]);
  translate([2,5.5,-0.5]) union() { 
    cube([13,2.25,t+1]);
    cube([18,1.5,t+1]);
  }

  translate([2,9.75,-0.5]) union() { 
    cube([13,2.25,t+1]);
    translate([0,0.75,0]) cube([18,1.5,t+1]);
  }
}

module base() {
  l=16.5;
  w=14;
  r=1.25;
  hull() {
    cylinder(r=r,h=t);
    translate([l-r*2,0,0]) cylinder(r=r,h=t);
    translate([0,w-r*2,0]) cylinder(r=r,h=t);
    translate([l-r*2,w-r*2,0]) cylinder(r=r,h=t);
  }
}