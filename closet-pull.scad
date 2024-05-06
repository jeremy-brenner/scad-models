
handle();
//clip();

module handle() {
  difference() {
    cylinder(r=10,h=60);
    translate([0,0,-0.1]) cylinder(r=8.8,h=80.2);
  }
}

module clip() {
  difference() {
    union() {
      cube([37.4,20,21.2]);
      translate([0,20,10]) rotate([90,0,0]) difference() {
        cylinder(r=10,h=20);
        translate([0,0,-0.1]) cylinder(r=10-1.2,h=20.2);
      }
    }
    translate([1.2,-0.1,-0.1]) cube([35,35.2,20.1]);
  }
}

