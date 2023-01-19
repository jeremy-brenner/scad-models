sideD=40;
r=sideD/(sqrt(3)/2);
h=4;
wh=2.5;

// translate([10,0,0]) color("red") rotate([90,0,90]) translate([-sideD,0,-r]) import("hexagon.STL");

difference() {
  cylinder(r=r,h=h,$fn=6);
  translate([0,0,-0.1]) cylinder(r=r-6,h=h+0.2,$fn=6);

  for ( c = [0 : 5] ){ 
    rotate([0,0,c*60]) wedge();
  }
}

module wedge() {
  color("blue") translate([0,40,h-wh]) {
    wedgeHalf();
    rotate([0,0,180]) wedgeHalf();
  }
}

module wedgeHalf() {
  translate([0,-1.5,0]) scale([1.4,1,1]) rotate([0,0,90]) cylinder(r=4,h=wh+0.01,$fn=3);
}