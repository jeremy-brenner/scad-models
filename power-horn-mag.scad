$fn=64;



difference() {
  intersection() {
    translate([0,0,-10]) mainRing();
    rotate([0,90,0]) cylinder(r=12,h=1000);
  }
  
  rotate([0,0,-7]) translate([64,0,0])  rotate([0,90,0]) cylinder(r=3.1,h=5);
  rotate([0,0,7]) translate([64,0,0])  rotate([0,90,0]) cylinder(r=3.1,h=5);
}

module mainRing() {
  difference() {
    cylinder(r=67,h=20);
    translate([0,0,-0.1]) cylinder(r=65,h=20.2);
  }
}