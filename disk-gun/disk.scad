$fn=64;

t=1.5;
mainR=9.75;
mainHoleR=7.25;
centerRingR=5.25;
centerHoleR=3.25;

crossBarWidth=3;

// cylinder(r=mainR,h=t);

outerRing();
centerRing();
crossBar();
rotate([0,0,90]) crossBar();


module outerRing() {
  difference() {
    cylinder(r=mainR,h=t);
    translate([0,0,-0.1]) cylinder(r=mainHoleR,h=t+0.2);
  }
}

module centerRing() {
  difference() {
    cylinder(r=centerRingR,h=t);
    translate([0,0,-0.1]) cylinder(r=centerHoleR,h=t+0.2);
  }
}

module crossBar() {
  difference() {
    translate([-crossBarWidth/2,-mainHoleR,0]) cube([crossBarWidth,mainHoleR*2,t]);
    translate([0,0,-0.1]) cylinder(r=centerRingR,h=t+0.2);
  }
}