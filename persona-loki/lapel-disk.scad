w=50;

$fn=64;

innerR=w/2-7;

color("silver") {

difference() {
  uncut();
  translate([0,0,1.5]) cylinder(r=innerR, h=50);
}


difference() {
  cutR=7.5;
  cutTR=innerR+1;
  cylinder(r=innerR,h=3);
  translate([innerR,0,-0.1]) cylinder(r=cutR,h=4);
  rotate([0,0,60]) translate([cutTR,0,-0.1]) cylinder(r=cutR,h=4);
  rotate([0,0,60*2]) translate([cutTR,0,-0.1]) cylinder(r=cutR,h=4);
  rotate([0,0,60*3]) translate([cutTR,0,-0.1]) cylinder(r=cutR,h=4);
  rotate([0,0,60*4]) translate([cutTR,0,-0.1]) cylinder(r=cutR,h=4);
  rotate([0,0,60*5]) translate([cutTR,0,-0.1]) cylinder(r=cutR,h=4);
}

cylinder(r=7.5,h=4);
cylinder(r=4,h=5);
}

module uncut() {
  intersection() {
    translate([0,0,-2]) sphere(r=w/2);
    translate([-500,-500,0]) cube([1000,1000,5]);
  }

  translate([0,0,5]) intersection() {
    translate([0,0,-86.7]) sphere(r=90);
    translate([-500,-500,0]) cube([1000,1000,5]);
  }
}


