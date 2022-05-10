
chainMount();

module chainMount() {
  translate([6,-22.5,-6]) {
    translate([0,20.5,0]) rotate([-90,0,0]) chainClip();
    mirror([0,1,0]) rotate([-90,0,0]) chainClip();
    translate([-5,20.5,6]) rotate([90,0,0]) cylinder(r=1,h=20.5);
  }
  translate([0,-24.5,0]) difference() {
    union() {
      cube([12,24.5,5]);
      translate([0,0,2.5]) rotate([-90,0,0]) cylinder(r=2.5,h=24.5);
    }
    translate([7,12.25,-1]) cylinder(r=5,h=7);
    translate([7,7.25,-1]) cube([6,10,7]);
  }
}

module chainClip() {
  difference() {
    union() { 
      cylinder(r=6,h=2);
      translate([-6,-6,0]) cube([12,6,2]);
    }
    translate([0,0,-0.01]) cylinder(r1=2.5,r2=1.5,h=2.02);
  }
}
