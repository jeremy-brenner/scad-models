poleR=7;
poleL=533;


module pole(plus=0) {
  rotate([0,90,0]) cylinder(r=poleR+plus,h=poleL);
}

module poles(poleD,doz=true,plus=0) {
  z= doz ? -poleR-4 : 0;
  translate([0,0,z]) {
    pole(plus);
    translate([0,poleD,0]) pole(plus);
  }
}

module poleScrewHole(hex=false) {
  translate([0,0,-poleR-4]) rotate([-90,0,0]) {
    cylinder(r=2.2,h=200);
    if(hex) {
      cylinder(r=4.2,h=4, $fn=6);
    }
  }
}
