h=250;
c=260;
t=3;

r=c/(2*PI);
$fn=64;

difference() {
  cylinder(r=r,h=h);
  translate([0,0,-1]) cylinder(r=r-t,h=h+2);
}

