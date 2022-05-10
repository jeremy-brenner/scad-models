$fn=64;

color("red") rotate([0,0,180]) scale([1,0.2]) cc(5);
translate([0,1]) { 
  rings();
  scale([1,0.2]) rings();
}


module rings() {
  cc(10);
  cc(9);
  cc(8);
  cc(7);
  cc(6);
  cc(5);
  cc(4);
  cc(3);
  cc(2);
  cc(1);
  
}
module cc(r) {
  linear_extrude(0.2) {
  difference() {
    circle(r=r+0.1);
    circle(r=r-0.1);
    translate([-r*2,0]) square([r*4,r*2]);
  }
  }
}
