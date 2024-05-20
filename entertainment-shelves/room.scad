// 1'3"  15"
// 5'8.5"  68.5"

// 8'  96"

 mms = 25.4;

wallH = 96*mms;
wallW = 68.5*mms;
sWallW = 15*mms;

rotate([0,0,45]) translate([0,400,0]) {
ps4();
translate([0,90,0]) ps5();
}

color("#ededda") {
rotate([0,0,45]) cube([1,wallW,wallH]);
translate([0,-sWallW,0]) cube([1,sWallW,wallH]);
}

color("#873e23") {
    translate([-2000,-2000,-1]) cube([5000,5000,1]);
}

color("#588723") {
    translate([-2000,-2000,wallH]) cube([5000,5000,1]);
}


// 57 33 19

color("black") {
    rotate([0,0,45]) rotate([0,10,0]) translate([0,150,wallH-33*mms-19*mms]) cube([10,57*mms,33*mms]);
}

module ps5() {
  //PlayStation 5 has a height of 15.4” (390 mm), width of 4.1” (104 mm), depth of 10.2" (260 mm)
  color("white") cube([260,104,390]);
}


module ps4() {
  //The PlayStation 4 has a height of 2.09” (53 mm), depth of 12” (305 mm), width of 10.8” (275 mm)
  color("black") cube([305,53,275]);
}

