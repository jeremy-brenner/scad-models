strapW=20;
strapT=3;

capT=2;
capW=12;

capX=strapW+capT*2;
capY=capW+capT;
capZ=strapT+capT*2;

color("silver") {
  difference() {
    cube([capX,capY,capZ]);
    translate([capT,capT,capT]) strap();
    translate([capX/2,capY/2,-1]) cylinder(r=1.5,h=100, $fn=32);
    translate([capX/2,capY/2,-1]) cylinder(r=3,h=2, $fn=32);
    translate([capX/2,capT+0.1,capZ/2]) rotate([90,0,0]) cylinder(r=strapT/2,h=10, $fn=32);
  }

 // translate([capX/2,-11,capZ/2]) ring();
}

module strap() {
  color("brown") cube([strapW,500,strapT]);
}

module ring() {
  scale([1,1,0.5]) torus(10,4);
  translate([0,15,0]) rotate([90,0,0]) cylinder(r=strapT/2-0.1,h=5, $fn=32);
}

module torus(r1,r2) {
  rotate([0,0,360/20]) rotate_extrude(convexity = 10, $fn=5)
    translate([r1, 0, 0])
    circle(r = r2, $fn=32);
}