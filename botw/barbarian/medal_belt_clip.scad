
screwHoleR=1.49;

color("silver") {
  medalBeltClip();
  //translate([0,0,-5]) medalBeltClipBacking();
}

module medalBeltClip() {
  difference() {
    union() {
      cylinder(r1=10, r2=6,h=4,$fn=4);
      translate([6,0,-2]) cylinder(r=screwHoleR+1,h=2,$fn=32);
      translate([-6,0,-2]) cylinder(r=screwHoleR+1,h=2,$fn=32);
    }
    translate([0,0,-3]) cylinder(r=3,h=30,$fn=32);
    translate([6,0,-3]) cylinder(r=screwHoleR,h=4,$fn=32);
    translate([-6,0,-3]) cylinder(r=screwHoleR,h=4,$fn=32);
  }
}

module medalBeltClipBacking() {
  difference() {
    cylinder(r=10,h=2,$fn=32);
    translate([0,0,-1]) cylinder(r=3,h=30,$fn=32);
    translate([6,0,-1]) cylinder(r=screwHoleR+0.1,h=5,$fn=32);
    translate([-6,0,-1]) cylinder(r=screwHoleR+0.1,h=5,$fn=32);

    translate([6,0,-1]) cylinder(r=3,h=2,$fn=32);
    translate([-6,0,-1]) cylinder(r=3,h=2,$fn=32);
    translate([-6,-3,-1]) cube([12,6,2]);

  }
}