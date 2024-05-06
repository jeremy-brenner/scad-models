
module star(sr,br,pr,ph,post=true) {
  intersection() {
    union() {
      for(i = [0:4]) {
        rotate([0,0,360/5*i]) point(sr,br);
      }
      if(post) {
        rotate([0,-90,0]) cylinder(r=pr,h=ph);
      }
    }
    cylinder(r=1000,h=1000);
  }
}

module point(sr,br) {
  hull() {
    translate([110,0,0]) sphere(r=sr, $fn=32);
    flatSphere(br);
  }
}

module flatSphere(br) {
  intersection() {
    scale([2,2,1]) sphere(r=br, $fn=64);
    translate([0,0,-5]) scale([2.5,2.5,1]) sphere(r=br, $fn=64);
  }
}

module eye(r) {
  color("#333333") {
    translate([0,20,0]) intersection() {
      hull() {
        translate([0,0,21]) {
          sphere(r=r);
          translate([0,0,-12]) cylinder(r=r,h=1);
        }
        translate([30,0,18])  {
          sphere(r=r);
          translate([0,0,-10]) cylinder(r=r,h=1);
        }
      }
      translate([0,0,13]) cylinder(r=1000,h=20);
    }
  }
}
