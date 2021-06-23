magnetHole();

module main() {
  magnetHole();
}

module magnetHole() {
  $fn=128;
  r=7.525;
  d=3.5;
  
  t=d+1;
  difference() {
    cylinder(r=r+2,h=t);
    translate([0,0,-1]) cylinder(r=2,h=t+2);
    translate([0,0,-1]) cylinder(r=r,h=d+1);
  }
}
