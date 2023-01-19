length = 180 * 10;
stlLength = 149;
scaleM = length / stlLength;

// needleBit(0);
connector();

module connector() {
  intersection() {
    cylinder(r=9.5,h=210);
    translate([0,-50,0]) cube([100,100,2000]);
  }
}

module needleBit(section) {
  sectionSize=380;
  //sectionSize=38000;

  rotate([0,0,45]) intersection() {
    difference() {
      scale(scaleM) import("hornet_needle.stl");
      translate([0,180,0]) rotate([-90,0,0]) cylinder(r=10,h=1530);
    }
    translate([-500,section*sectionSize,0]) cube([1000,sectionSize,100]); 
  }
}