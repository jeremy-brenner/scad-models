$fn=128;

difference() {
// monogram();
  // daisyCenter();
  // daisyPetals();
  // onePiece();
  // onePiecePiece(0);
  top();
}

  onePiecePiece(1);
  // onePiecePiece(2);
  onePiecePiece(0);
// plugBottom();





module daisyCenter() {
  color("yellow") {
    cylinder(r=2.5,h=3.36);
    translate([0,0,3.36]) scale([1,1,0.3]) sphere(r=2.5);
  }
}

module daisyPetals() {
  for ( i = [0 : 11] ){
    rotate([0,0,i*30]) petal();
  }
}

module petal() {
  color("pink") translate([6.5,0,0]) scale([3,1,1]) {
    cylinder(r=1.2,h=3.2);
    translate([0,0,3.2]) scale([1,1,0.3]) sphere(r=1.2);
  }
}


module plugBottom() {
  translate([0,0,-4.5]) clover();
  translate([0,0,-9]) clover();

  translate([-5,-0.4,-9]) cube([10,0.8,9]);
  rotate([0,0,90]) translate([-5,-0.4,-9]) cube([10,0.8,9]);
}

module onePiecePiece(p) {
  if(p==0) color("yellow") intersection() {
    onePiece();
    union() {
      translate([-10,0.9,-1]) cube([20,1,5]);
      translate([-4.6,3.4,-1]) cube([9.2,4,5]);
    }
  }
  if(p==1) color("red") intersection() {
    onePiece();
    union() {
      translate([-5,1.8,-1]) cube([10,1,5]);
      translate([-4.9,2.8,-1]) cube([9.8,0.5,5]);
    }
  }
  if(p==2) color("white") difference() {
    onePiece();
    translate([-10,0.9,-1]) cube([20,1,5]);
    translate([-4.6,3.4,-1]) cube([9.2,4,5]);
    translate([-5,1.8,-1]) cube([10,1,5]);
    translate([-4.9,2.8,-1]) cube([9.8,0.5,5]);
  }
}

module onePiece() {
  translate([0,0,0.01]) linear_extrude(height=3.4) scale(0.13) translate([-74,-68])  import("one-piece.svg");
}

module monogram() {
  color("magenta") linear_extrude(height=3.2) scale(0.085) translate([-147,-123]) import("dk-monogram.svg");
}

module top() {
  color("black") intersection() {
    scale([1,1,0.26]) sphere(r=11.25);
    cylinder(r=12,h=4);
  }
}

module clover() {
  translate([5,0,0]) cylinder(r=5,h=0.8);
  rotate([0,0,90]) translate([5,0,0]) cylinder(r=5,h=0.8);
  rotate([0,0,180]) translate([5,0,0]) cylinder(r=5,h=0.8);
  rotate([0,0,270]) translate([5,0,0]) cylinder(r=5,h=0.8);
}