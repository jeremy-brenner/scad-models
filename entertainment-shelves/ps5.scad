
ps4();
translate([0,90,0]) ps5();

module ps5() {
  //PlayStation 5 has a height of 15.4” (390 mm), width of 4.1” (104 mm), depth of 10.2" (260 mm)
  cube([260,104,390]);
}


module ps4() {
  //The PlayStation 4 has a height of 2.09” (53 mm), depth of 12” (305 mm), width of 10.8” (275 mm)
  cube([305,53,275]);
}