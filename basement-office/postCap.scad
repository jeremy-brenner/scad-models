$fn=32;
rodR=2;
innerR=rodR+0.25;

t=1.2;
h=8;


difference() {
  rotate([0,0,30]) cylinder(r=7.5,h=h+t, $fn=6);
  translate([0,0,t]) cylinder(r=innerR,h=h+0.1);
  translate([-50,rodR,4+t]) rotate([0,90,0]) cylinder(r=0.5,h=100);
  translate([-50,-rodR,4+t]) rotate([0,90,0]) cylinder(r=0.5,h=100);
}

 rotate([0,0,30]) translate([0,0,-t*2]) cylinder(r1=0, r2=7.5,h=t*2, $fn=6);

// cylinder(r=5.5,h=2);