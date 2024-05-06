t=1.2;
w=10;
r=1.25;

//11.6
//28

$fn=64;


difference() {
  cylinder(r=r+t,h=w);
  translate([0,0,-0.1]) cylinder(r=r,h=w+0.2);
  translate([-10,0,-0.1]) cube([20,20,w+0.2]);
}

translate([-r-t/2,0,0]) cylinder(r=t/2,h=w);
translate([r+t/2,0,0]) cylinder(r=t/2,h=w);
translate([-12,-11.6+1.25,0]) {
  cube([24,t,w]);
  translate([0,t/2,0]) cylinder(r=t/2,h=w);
  translate([24,t/2,0]) cylinder(r=t/2,h=w);
  translate([6,0,0]) scale([3,1,1]) cylinder(r=t,h=w);
  translate([18,0,0]) scale([3,1,1]) cylinder(r=t,h=w);
}

translate([r+t/2,0,0]) rotate([0,0,-43.85]) translate([0,-t/2,0]) cube([14.05,t,w]);
mirror([1,0,0]) translate([r+t/2,0,0]) rotate([0,0,-43.85]) translate([0,-t/2,0]) cube([14.05,t,w]);


// translate([0,-11.6+1.25,0]) cube([2,11.6,2]);