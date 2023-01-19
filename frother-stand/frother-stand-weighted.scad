$fn=128;

// mainPiece();
// topBracket();
bottomBracket();

module mainPiece() {
  difference() {
    stand();
    topCutter();
    bottomCutter();
  }
  translate([0,0,-6]) base();
}

module topBracket() {
  intersection() {
    stand();
    topCutter();
  }
}

module bottomBracket() {
  intersection() {
    stand();
    bottomCutter();
  }
}

module topCutter() {
  translate([0,0,165]) cutter();
}

module bottomCutter() {
  translate([0,0,125]) cutter();
}

module cutter() {
  color("red") cylinder(r=27.5,h=20);
}

module base() {
  difference() {
    union() {
      cylinder(r=42, h=4);
      translate([0,0,4]) hull() torus(40,2);
    }
    translate([0,0,2]) weight();
  }
}

module weight() {
  difference() {
      cylinder(r=25.75,h=4.1);
      translate([0,0,-0.1]) cylinder(r=10,h=4.3);
  }
}


module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn/2);
}

module stand() {
  translate([-154.1985,0.0,139.59]) import("frother_stand.stl");
}