t=2;

r=100;
$fn=128;

ca=4;
earBand(30);

module earBand(w) {
  scale([1.1,1,1]) difference() {
    cylinder(r=r,h=w);
    translate([0,0,-0.1]) {
      cylinder(r=r-t,h=w+0.2);
      rotate([0,0,ca]) translate([-r,-r,0]) cube([r*2,r,w+0.2]);
      rotate([0,0,-ca]) translate([-r,-r,0]) cube([r*2,r,w+0.2]);
    }
  }

  loop(43,14,w);
  loop(4,12,w);

  mirror([1,0,0]) {
    loop(43,14,w);
    loop(4,12,w);
  }
}

module loop(loopas,loopd,w) {
  loopr=r-5;
  loopae=loopas+loopd;

  scale([1.1,1,1]) {
    difference() {
      cylinder(r=loopr,h=w);
      translate([0,0,-0.1]) {
        cylinder(r=loopr-t,h=w+0.2);
        rotate([0,0,loopas]) translate([-r,-r,0]) cube([r*2,r,w+0.2]);
        rotate([0,0,-179+loopae]) translate([-r,-r,0]) cube([r*2,r,w+0.2]);
      }
    }
    rotate([0,0,loopas]) translate([loopr,0,0]) cube([5,t,w]);
    rotate([0,0,loopae]) translate([loopr,0,0]) cube([5,t,w]);

  }
}