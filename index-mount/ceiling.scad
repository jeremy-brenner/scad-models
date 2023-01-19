t=1.8;
$fn=32;

baseD=[93.5, 71, 6];
baseScrewDistance=69.5;
baseScrewOffset=2;
plateT=3.5;

bracket();
// sidePiece();

module bracket() {
  difference() {
    union() {
      translate([-baseD[0]/2-t,-baseD[1]/2,0]) cube([baseD[0]+t, baseD[1], plateT]);
      sidePiece();
      mirror([0,1,0]) sidePiece();
    }
    translate([baseD[0]/5,0,-2.5]) screw();
    translate([-baseD[0]/5,0,-2.5]) screw();
    // baseScrews();
  }
}

module baseScrews() {
  translate([-baseScrewDistance/2-baseScrewOffset,0,-1]) {
    baseScrew();
    translate([baseScrewDistance,0,0]) baseScrew();
  }
}

module baseScrew() {
  translate([0,0,-0.1]) cylinder(r=3.25,h=2.6, $fn=6);
  cylinder(r=1.8,h=6);
}

module sidePiece() {
  translate([-baseD[0]/2-t,baseD[1]/2-10+t,0]) {
    difference() {
      cube([baseD[0]+t, 10, baseD[2]+plateT+t]);
      translate([-0.1,-t,0]) cube([baseD[0]+t+0.2, 10, baseD[2]+plateT]);
    }
    cube([t,10,10]);
    translate([baseD[0]+t-1,0,baseD[2]+plateT]) rotate([-90,0,0]) cylinder(r=1,h=10);
  }
}

module screw() {
    translate([0,0,5.99]) cylinder(r=4,h=0.2);
    translate([0,0,3]) cylinder(r1=1.75, r2=4, h=3);
    cylinder(r=1.75,h=3.1);
    translate([0,0,-0.19]) cylinder(r=1.75, h=0.2);
}

module base() {
  color("black") translate([-baseD[0]/2,-baseD[1]/2,plateT]) difference() {
    cube(baseD);
  }
}
//cube([93.5, 71, t]);
//cube([93.5, 71, 6]);