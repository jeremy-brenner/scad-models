$fn=32;
poleR=7;
postR=2.25;
h=46;


jigPiece();
armBit([131,217,265,40]);
// armBit(55);
//translate([0,40,0]) mirror([0,1,0]) jigPiece();

function maximum(a, i = 0) = (i < len(a) - 1) ? max(a[i], maximum(a, i +1)) : a[i];

module armBit(lengths) {
  length=maximum(lengths);
  offset=20;
  translate([0,offset,0]) difference() {
    union() {
      translate([-poleR,0,0]) cube([poleR*2,length-offset,h/2]);
      translate([0,length-offset,0]) cylinder(r=poleR,h=h/2);
    }
    translate([0,-0.1,h/2]) rotate([-90,0,0]) cylinder(r=poleR,h=length*2);
    for(y=lengths) {
      translate([0,y-offset,-0.1]) {
        cylinder(r=2.2,h=h);
        cylinder(r=4.2,h=3.2,$fn=6);
      }
    }
  }
}

module jigPiece() {
  intersection() {
    basePart(poleR);
    translate([-16,-50,0]) cube([32,100,100]);
  }
}

// postInsert(postR);

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
    cylinder(r=27,h=h);
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
