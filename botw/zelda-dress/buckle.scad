//$fn=128;
$fn=32;

sphereSize=100;
cutDepth=10;

triforce();

rotate([0,0,180]) {
  //plate();

//  translate([0,0,10]) triforce();

}
//groovySphere();

module groovySphere() {
  difference() {
    sphere(r=100);
    color("gray") {
      mainTriangle(14,49);
    }
  }

}

module triforce() {
  tSize=8;
 scale([1,1,0.2]) difference() {
    mainTriangle(14,45);
  
    color("teal") {
      rotate([0,0,180]) triangleChopper(tSize,5);
      rotate([30,0,0]) triangleChopper(tSize,5);
      rotate([0,0,120]) rotate([30,0,0]) triangleChopper(tSize,5);
      rotate([0,0,240]) rotate([30,0,0]) triangleChopper(tSize,5);
    }
  }
}

module plate() {
  translate([0,0,10]) scale([1,1,0.2]) intersection() {
    groovySphere();
    translate([-100,-100,0]) cube([200,200,100]);
  }
  cylinder(r=100,h=10);
}

module mainTriangle(angle,dist) {

  difference() {
    intersection() {
      triangleChopper(angle,dist);
      translate([-100,-100,0]) cube([200,200,200]);
      sphere(r=sphereSize+1);
    }
    sphere(r=sphereSize-cutDepth);
  }
}

module triangleChopper(angle,dist) {
  size=2000;
  intersection() {
    triangleBit(angle,dist,size);
    rotate([0,0,120]) triangleBit(angle,dist,size);
    rotate([0,0,240]) triangleBit(angle,dist,size);
  }
}

module triangleBit(ang,dist,size) {
  rotate([-ang,0,0]) translate([0,dist,0]) rotate([90,0,0]) {
    translate([-size/2,-size/2,0]) cube([size,size,size]);
  };
}