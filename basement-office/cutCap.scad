$fn=32;
rodR=2;
t=1.2;
h=3;

difference() {
  cylinder(r=rodR+0.1+t,h=h+t);
  translate([0,0,t]) cylinder(r=rodR+0.1,h=h+0.1);
}