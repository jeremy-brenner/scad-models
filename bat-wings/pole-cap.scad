r=6.375;
$fn=32;

or=r+1.6;

finT=1.6*2;

// singleSide();
doubleSide(true);
// doubleFortyFive();
// singleFortyFive();
// halfSide();
// halfCap();
// singleCap();
// doubleCap();
// doubleSingle();
// passthru(true);
// doublePassthru();

module doublePassthru() {
passthru(true);
translate([0,0,-80]) passthru(false);
translate([0,0,-70]) difference() {
  cylinder(r=r+1.6,h=70);
  translate([0,0,-0.1]) cylinder(r=r,h=80.2); 
}
}

module passthru(capped=false,extra=0) {
  difference() {
    ch = capped ? or*2+1.6 : or*2;
    union() {
      cylinder(r=r+1.6,h=ch+extra);
      translate([0,or,or+extra]) rotate([90,0,0]) cylinder(r=or,h=or*2);
    }
    translate([0,0,-0.1]) cylinder(r=r,h=or*2+0.2+extra);
    translate([0,or+1,or+extra]) rotate([90,0,0])  cylinder(r=2,h=or*2+2);
  }
}

module doubleSingle() {
singleSide(true);
translate([0,0,-80]) singleSide(false);
translate([0,0,-80]) difference() {
  cylinder(r=r+1.6,h=80);
  translate([0,0,-0.1]) cylinder(r=r,h=80.2); 
}
}

module singleFortyFive() {
  difference() {
    union() {
      cylinder(r=r+1.6,h=or*3+1.6);
      translate([0,3.8,or*2-2]) rotate([45,0,0]) translate([0,0,5]) fin(8);
    }
    translate([0,0,-0.1]) cylinder(r=r,h=or*3+0.1);
  }
}

module doubleFortyFive() {
  difference() {
    union() {
      cylinder(r=r+1.6,h=or*3+1.6);

      translate([0,3.8,or*2-2]) rotate([45,0,0]) translate([0,0,5]) union() {
        translate([finT+0.1,0,0]) fin(11);
        mirror([1,0,0]) translate([finT+0.1,0,0]) fin(11);
        translate([-(finT*3+0.2)/2,-or,0]) cube([finT*3+0.2,or*2,10]);
      }
    }
    translate([0,0,-0.1]) cylinder(r=r,h=or*3+0.1);
  }
}


module singleSide(capped=false) {
  difference() {
    ch = capped ? or*2+1.6 : or*2;
    cylinder(r=r+1.6,h=ch);
    translate([0,0,-0.1]) cylinder(r=r,h=or*2+0.2);
  }

  translate([0,3.8,or]) rotate([90,0,0]) fin();
}

module doubleSide(capped=false) {
  difference() {
    ch = capped ? or*2+1.6 : or*2;
    cylinder(r=r+1.6,h=ch);
    translate([0,0,-0.1]) cylinder(r=r,h=or*2+0.2);
  }
   translate([0,3.8,or]) rotate([90,0,0]) union() {
      translate([finT+0.1,0,0]) fin();
      mirror([1,0,0]) translate([finT+0.1,0,0]) fin();
      translate([-(finT*3+0.2)/2,-or,10.1]) cube([finT*3+0.2,or*2,1.7]);
    }
}


module halfCap() {
    difference() {
    cylinder(r=r+1.6,h=11.6);
    translate([0,0,-0.1]) cylinder(r=r,h=10.2);
  }

      translate([finT/2,0,0]) fin();
      translate([finT+finT/2,0,0]) fin();
      translate([finT+finT/2+1.6,0,0]) fin();
}

module halfSide() {
  difference() {
    union() {
      cylinder(r=r+1.6,h=or*2);
      translate([0,7,or]) rotate([90,0,0]) { 
        translate([finT/2,0,0]) fin();
        translate([finT+finT/2,0,0]) fin();
        translate([finT+finT/2+1.6,0,0]) fin(4.6);
      }
    }
    translate([0,0,-0.1]) cylinder(r=r,h=or*2+0.2);
  }

   
}




module singleCap() {

  difference() {
    cylinder(r=r+1.6,h=21.6);
    translate([0,0,-0.1]) cylinder(r=r,h=20.2);
  }
  translate([0,0,10]) intersection() {
    fin();
    cylinder(r=or,h=100);
  }
}
module doubleCap() {

  difference() {
    cylinder(r=r+1.6,h=21.6);
    translate([0,0,-0.1]) cylinder(r=r,h=20.2);
  }
  translate([0,0,10]) intersection() {
    union() {
      translate([finT+0.1,0,0]) fin();
      mirror([1,0,0]) translate([finT+0.1,0,0]) fin();
    }
    cylinder(r=or,h=100);
  }
}

module fin(extra=0) {
  translate([0,0,or+11.6]) rotate([0,90,0]) {
    translate([0,0,-finT/2]) difference() {
    union() {
      cylinder(r=or,h=finT);
      translate([0,-or,0]) cube([r+1.6+extra,or*2,finT]);
    }
      translate([0,0,-4]) cylinder(r=2,h=10);

    }
  }
}
