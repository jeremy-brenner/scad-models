use <./monitors.scad>



$fn=32;

p=0; // [0:0.1:1]
//p = $t*2 < 1 ? $t*2 : 1-($t*2-1);

lal=160;
sal=lal*0.5;
lhl=lal*0.5625;
tal=lal*0.375;
ttl=lal*0.5;
minSA=7;
maxSA=72;
bw=40;

hr=2;

mScale=0.35;
mOffset=250;

 liftWithOmen(p,mScale,mOffset);
//  liftWithDell(p,mScale,mOffset);

echo("sal", sal/mScale);
echo("lal", lal/mScale);
echo("lhl", lhl/mScale);
echo("tal", tal/mScale);
echo("ttl", ttl/mScale);

scale(1/mScale) {
//  lift(p);

// translate([0,0,10]) bottomThing();
// translate([0,0,33]) arm(sal,0);
// translate([0,0,48]) arm(lal,0,lhl);
// translate([120,0,33]) arm(tal,0);
// topThing(0,ttl);

}

module liftWithOmen(p,mScale,mOffset) {
  scale(1/mScale) lift(p) {
    rotate([0,90,0]) scale(mScale) translate([-90,0,mOffset]) omen();  
  }
}

module liftWithDell(p,mScale,mOffset) { 
  scale(1/mScale) lift(p) {
    rotate([0,90,0]) scale(mScale) translate([-90,0,mOffset]) dell();  
  }
}

module lift(p) {
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

  translate([13,-bw/2,-7]) bottomThing();
  translate([22,0,0]) {
    translate([13,0,0]) {
      translate([0,bw/2+5,0]) arm(sal,sa); 
      translate([da+db,bw/2,0]) mirror([1,0,0]) arm(lal,la,lhl);
    }
    translate([0,bw/2,0]) arm(tal,ba+taaa);
    mirror([0,1,0]) {
      translate([13,0,0]) {
        translate([0,bw/2+5,0]) arm(sal,sa); 
        translate([da+db,bw/2,0]) mirror([1,0,0]) arm(lal,la,lhl);
      }
      translate([0,bw/2,0]) arm(tal,ba+taaa);
    }
    translate([mx-ttl, -bw/2, lz]) {
      topThing(ba-ttaa,ttl) translate([0,bw/2,0]) children();
    }
  }
}

module bottomThing() {
  difference() {
    union() {
      cube([200,bw,14]);
      translate([22,-5,7]) rotate([-90,0,0]) cylinder(r=7,h=bw+5*2);
    }
    translate([9,-1,7]) rotate([-90,0,0]) cylinder(r=hr,h=bw+20);
    translate([22,-10,7]) rotate([-90,0,0]) cylinder(r=hr,h=bw+20);
    translate([94,-1,7]) rotate([-90,0,0]) hull() {
      cylinder(r=hr,h=bw+20);
      translate([96,0,0]) cylinder(r=hr,h=bw+20);
    }
  }
}

module topThing(a,o) {
  translate([o,0,0]) rotate([0,-a,0]) translate([-o,0,-6]) {
      difference() {
        union() {
          translate([0,0,6]) rotate([-90,0,0]) cylinder(r=6,h=bw);
          cube([250,bw,12]);
        }
        translate([0,0,6]) rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=hr,h=bw+2);
        translate([o,0,6]) rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=hr,h=bw+2);
      }
      children();
    }
}

module arm(l,a,eh=0) {
  or=6;
  color("blue") rotate([0,-a,0]) {
    difference() {
      hull() {
        rotate([-90,0,0]) cylinder(r=or,h=5);
        translate([l,0,0]) rotate([-90,0,0]) cylinder(r=or,h=5);
      }
      rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=hr,h=5.2);
      translate([l,0,0]) rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=hr,h=5.2);
      translate([eh,0,0]) rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=hr,h=5.2);
    }
  }
}

module omen() {
  translate([0,0,600]) mirror([1,0,0]) mirror([0,0,1]) rotate([0,0,90]) omenMonitor();
}

module dell() {
  translate([0,0,600]) mirror([1,0,0]) mirror([0,0,1]) rotate([0,0,90]) dellMonitor();
}

function angleFor(a,l1,l2) = asin((sin(a)*l1)/l2); 
