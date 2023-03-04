$fn=32;
poleR=7;
postR=2.25;

// intersection() {
//   basePart(postR);
//   translate([-16,-50,0]) cube([32,100,100]);
// }

postInsert(postR);

module postInsert(holeR) {
  h=46;
  difference() {
    intersection() {
      cylinder(r=9.5,h=h/2);
      translate([-13.5/2,-10,0]) cube([13.5,20,h/2]);
    }
    translate([0,3,h/2]) rotate([90,0,0]) cylinder(r=holeR,h=100);
  }
}

// translate([0,0,62.8]) mirror([0,0,1]) dremilPart();

module basePart(holeR) {
  difference() {
    h=46;
    cylinder(r=30,h=h);
   translate([0,50,h/2]) rotate([90,0,0]) cylinder(r=holeR,h=100);
    translate([0,0,-1]) cylinder(r=9.75,h=h+2);
    translate([0,0,-1]) difference() {
      cylinder(r=13.75,h=h+2);

      hull() {
        translate([0,50,0]) rotate([90,0,0]) cylinder(r=13.5/2,h=100);
        translate([0,50,h/2]) rotate([90,0,0]) cylinder(r=13.5/2,h=100);
      }
      
    }
}
}

module dremilPart() {
  difference() {
    cylinder(r=13.5,h=62.8);
    translate([0,0,-0.1]) cylinder(r=9.75,h=2.1);
    translate([0,0,0.4]) import("dremel_thread.stl");
    translate([0,0,12.8]) cylinder(r=9.75,h=50.1);
    hull() {
      translate([0,50,39.8]) rotate([90,0,0]) cylinder(r=7,h=100);
      translate([0,50,69.8]) rotate([90,0,0]) cylinder(r=7,h=100);
    }
  }
}
