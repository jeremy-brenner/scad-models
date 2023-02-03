use <./monitors.scad>



$fn=32;

p=0; // [0:0.1:1]
//p = $t*2 < 1 ? $t*2 : 1-($t*2-1);
mScale=0.7;

lal=160;
sal=lal*0.5;
lhl=lal*0.5625;
tal=lal*0.375;
ttl=lal/2;
minSA=7;
maxSA=72;
sa=(maxSA-minSA)*p+minSA;
la=angleFor(sa,sal,lhl);
da=cos(la)*lhl;
db=cos(sa)*sal;
lx=cos(la)*lal;
lz=sin(la)*lal;
mx=da+db-lx+13;
dd=sqrt(mx^2+lz^2);
ba=atan(lz/mx);     
d1=(dd^2-tal^2+ttl^2)/(2*dd);
d2=dd-d1;
taaa=acos(d2/tal);
ttaa=acos(d1/ttl); 

scale(1/mScale) lift() {
  rotate([0,90,0]) scale(mScale) translate([-80,0,-200]) omen();  
}

module lift() {
  translate([22,0,0]) {
    translate([13,0,0]) {
      arm(sal,sa); 
      translate([da+db,0,0]) mirror([1,0,0]) arm(lal,la,lhl);
    }
    color("red") translate([0, 5, 0]) sphere(r=1);
    translate([da+db-lx+13, 5, lz]) color("red") sphere(r=1);
    arm(tal,ba+taaa);
    translate([mx-ttl, 5, lz]) {
      topThing(ba-ttaa,ttl) children();
    }
  }
}

module topThing(a,o) {
  translate([o,0,0]) rotate([0,-a,0]) translate([-o,0,-6]) {
      translate([0,0,6]) rotate([-90,0,0]) cylinder(r=6,h=24);
      cube([250,24,12]);
      children();
    }
}

module arm(l,a,eh=0) {
  or=6;
  hr=3;
  color("blue") rotate([0,-a,0]) {
    difference() {
      union() {
        rotate([-90,0,0]) cylinder(r=or,h=5);
        translate([0,0,-or]) cube([l,5,or*2]);
        translate([l,0,0]) rotate([-90,0,0]) cylinder(r=or,h=5);
      }
      rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=hr,h=5.2);
      translate([l,0,0]) rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=hr,h=5.2);
      translate([eh,0,0]) rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=hr,h=5.2);
    }
  }
}

module omen() {
  translate([0,0,300]) mirror([1,0,0]) rotate([0,0,90]) omenMonitor();
}

function angleFor(a,l1,l2) = asin((sin(a)*l1)/l2); 
