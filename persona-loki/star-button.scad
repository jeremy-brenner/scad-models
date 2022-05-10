ss=1.1;

intersection() {
  union() {
    cylinder(r=6,h=2.5,$fn=3);
    rotate([0,0,180]) cylinder(r=6,h=2.5,$fn=3);
  }
  translate([0,0,-9.2]) scale([ss,ss,1]) sphere(r=12);
}