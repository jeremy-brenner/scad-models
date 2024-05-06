
gem();

module gem() {
  intersection() {
    scale([1,0.5,1]) drop();
    translate([-1000,0,-1000]) cube([10000,10000,10000]);
  }
}

module drop() {
  r=10;
  $fn=32;

  scale([1,1,1.1]) {
    translate([0,0,r*1.48]) cylinder(r1=r/2,r2=0.1,h=6);

    translate([0,0,r/2*1.5]) scale([1,1,2]) translate([0,0,-r/2]) intersection() {
      sphere(r=r);
      translate([-r,-r,r/2]) cube([r*2,r*2,r/2]);
    }

    scale([1,1,1.5]) intersection() {
      sphere(r=r);
      translate([-r,-r,0]) cube([r*2,r*2,r/2+0.1]);
    }

    intersection() {
      sphere(r=r);
      translate([-r,-r,-r]) cube([r*2,r*2,r+0.1]);
    }
  }
}
