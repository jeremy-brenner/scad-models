$fn=32;

// lightBracket();

bigBracket();

module bigBracket() {

  translate([-20,90,-4]) rotate([0,180,0]) lightBracket();
  translate([-20,-90,-4]) rotate([0,180,0]) lightBracket();

  translate([-10,-75,-2]) cube([20,150,2]);

  translate([0,-40,0]) backHole(2);
  translate([0,40,0]) backHole(2);

  translate([0,-25,0]) backHole(2);
  translate([0,25,0]) backHole(2);

}


module backBracket() {
  difference() {
    union() {
      translate([0,-7.5,4]) backHole(2);
      translate([0,7.5,4]) backHole(2);
      hull() {
        translate([0,-9.5,0]) cylinder(r=5,h=4);
        translate([0,9.5,0]) cylinder(r=5,h=4);
      }
    }
    translate([0,-7,-0.1]) {
      cylinder(r=1.75,h=10);
      cylinder(r=3.2,h=3.1,$fn=6);
    }
    translate([0,+7,-0.1]) {
      cylinder(r=1.75,h=10);
      cylinder(r=3.2,h=3.1,$fn=6);
    }
  }
}

module lightBracket() {
  difference() {
    base();
    translate([0,-7,-5]) cylinder(r=1.75,h=10);
    translate([0,+7,-5]) cylinder(r=1.75,h=10);
  }
}

module backHole(h) {
  hull() {
    translate([0,-2,0]) cylinder(r=3,h=h);
    translate([0,2,0]) cylinder(r=3,h=h); 
  }
}


module base() {
  r=20;
  intersection() {
    shape(10);
    translate([-10,-19,0]) cube([20,38,10]);
    translate([0,19,-r+3]) rotate([90,0,0]) cylinder(r=r,h=42,$fn=128);
  }
  
  translate([0,0,-2]) shape(2);
  //translate([-19,-19,-2]) cube([38,38,2]);
}


module shape(h) {
  cr=12;
  hull() {
    translate([19-cr,19-cr,0]) cylinder(r=cr,h=h);
    translate([-19+cr,-19+cr,0]) cylinder(r=cr,h=h);
    translate([19-cr,-19+cr,0]) cylinder(r=cr,h=h);
    translate([-19+cr,19-cr,0]) cylinder(r=cr,h=h);
  }
}