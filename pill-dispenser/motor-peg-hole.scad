

$fn=64;
difference() {
  cylinder(r=3.5,h=6);
  translate([0,0,-0.5]) pegHole();
}


module pegHole() {
  pw=3.2;
  pr=2.7;
  ph=7;

  intersection() {
    cylinder(r=pr,h=ph);
    translate([-pw/2,-pr,0]) cube([pw,pr*2,ph]);
  }
}