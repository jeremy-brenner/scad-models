sr=3.25/2;
tt=1.2;
th=20;

$fn=64;
difference() {
  cylinder(r=sr+tt,h=th);
  translate([0,0,-0.1]) cylinder(r=sr,h=th+0.2);
}