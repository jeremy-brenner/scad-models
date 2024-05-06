
difference() {
  $fn=32;
  cylinder(r=5,h=5);
  translate([0,0,-2]) woodScrewNum8();
}

module woodScrewNum10() {
  $fn=32;
  translate([0,0,7.99]) cylinder(r=5, h=4.1);
  translate([0,0,4]) cylinder(r1=2, r2=5, h=4);
  translate([0,0,-0.1])  cylinder(r=2.6, h=6);
}


module woodScrewNum8() {
  $fn=32;
  translate([0,0,6.49]) cylinder(r=4.3, h=3.6);
  translate([0,0,4]) cylinder(r1=2.3, r2=4.3, h=2.5);
  translate([0,0,-0.1]) cylinder(r=2.3, h=6);
}