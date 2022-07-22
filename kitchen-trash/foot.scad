$fn=64;

rr=0.5;
poleR=6.9;
extra=1.6;

top();

poleFoot(0,extra);
translate([0,0,-(poleR+3)*2]) mirror([0,0,1]) poleFoot(0);

// poleFoot(5,extra);
// translate([0,0,-(poleR+3)*2]) mirror([0,0,1]) poleFoot(5);

// normalFoot();

module normalFoot() {
  translate([0,0,-2.5]) difference() {
    cylinder(r=11,h=2.5);
    translate([0,0,-0.1]) cylinder(r=1.5,h=3);
    torus(3,rr);
    torus(3+2,rr);
    torus(3+2*2,rr);
    torus(3+2*3,rr);
  }
}

module poleFoot(offset=0,extra=0) {
  ch=poleR+2.5;
  translate([0,0,-ch-extra]) difference() {
    cylinder(r=11,h=ch+extra);
    translate([0,0,-0.1]) cylinder(r=6,h=ch+extra+0.2);
    rotate([0,90,0]) translate([0,offset,-500]) cylinder(r=poleR,h=1000);
  }
}

module top() {
  difference() {
    cylinder(r=7.75,h=10);
    translate([0,0,-0.1]) cylinder(r=6,h=10.2);
  }
  translate([0,0,2.5]) torus(7.75,0.4);
  translate([0,0,2.5*2]) torus(7.75,0.4);
  translate([0,0,2.5*3]) torus(7.75,0.4);
}


module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn);
}
