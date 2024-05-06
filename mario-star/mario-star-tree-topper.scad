include <./mario-star.scad>


starHalfFront();
// starHalfBack();
// eyePiece();
// mirror([0,1,0]) eyePiece();
// ledMount();
// post();
// rotate([0,-90,0]) cylinder(r=13.5,h=100);

module ledMount() {
  mirror([0,0,1]) intersection() {
    star(3,26,10,101,false);
    translate([0,0,8]) cylinder(r=100,h=2);
  }
}

module eyePiece() {
  eye(7);
  intersection() {
    translate([0,0,-0.2]) star(3,26,10,101);
    eye(7.8);
  }
}

module starHalfBack() {
  mirror([0,0,1]) starHalf();
}

module starHalfFront() {
  difference() {
    starHalf();
    eye(7.2);
    mirror([0,1,0]) eye(7.2);
  }
}


module starHalf() {
  difference() {
    star(5,28,12,95);
    translate([0,0,-0.1]) star(3,26,10,101);
  }
}

module post() {
  color("green") 
    difference() {
    translate([-125,0,0]) rotate([0,90,0]) difference() {
      hull() {
        translate([0,0,-60]) cylinder(r=18+4.5,h=0.1);
        translate([0,0,80]) cylinder(r=13.5,h=0.1);
      }
      hull() {
        translate([0,0,-60.1]) cylinder(r=16+4.5,h=0.1);
        translate([0,0,30.1]) cylinder(r=12.5,h=0.1);
      }
    }
    union () {
      star(5.2,28.2,12.2,95);
      translate([0,0,0.01]) mirror([0,0,1]) star(5.2,28.2,12.2,95);
    }
  } 
}
