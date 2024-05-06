$fn=32;


concaveHalf();
mirror([0,1,0]) convexHalf();


module convexHalf() {
  difference() {
    halfRing();
    translate([-6.5,0,-0.1]) cylinder(r=2,h=6.2);
  }
}

module concaveHalf() {
  halfRing();
  translate([-6.5,0,0]) cylinder(r=1.5,h=1.5);
  translate([-6.5,0,4.5]) cylinder(r=1.5,h=1.5);
}

module halfRing() {
  difference() {
    cylinder(r=8,h=6);
    translate([0,0,-0.1]) cylinder(r=5,h=6.2);
    translate([0,-3.5,-0.1]) cube([10,7,6.2]);
    translate([0,0,1.5]) cylinder(r=7,h=3);
    translate([-10,0,-0.1]) cube([20,10,6.2]);
  } 
}
