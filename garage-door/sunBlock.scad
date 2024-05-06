t=1.6;
id=46;
cr=20;
ch=60;
cw=18;

co=8;

$fn=128;

sideone=true;


//  wholeCover();

intersection() {
  ct= sideone ? -100 : 0;
  o=20;
  wholeCover();
  translate([-100,ct,-o]) cube([200,100,o+100]);
}

module wholeCover() {
  clip(true);
  mirror([1,0,0]) clip(false);

  difference() {
    cylinder(r=cr,h=ch);
    translate([0,0,-0.1]) cylinder(r=cr-t,h=ch + 0.2);
  }

  translate([0,0,-t]) intersection() {
    cylinder(h=t,r=cr);
    translate([-cr,-cr-co,-0.1]) cube([cr*2,cr,t+0.2]);
  }
}

module clip(top) {
  difference() {
    union() {
      if(top) {
        bh=t*2+2;
        translate([id/2-t,-co,-8]) cube([t,cw+co,8]);
        translate([id/2-bh,0.1,-8-t]) cube([bh,cw,t]);
        translate([id/2-bh+t/2,0.1,-8]) rotate([-90,0,0]) cylinder(r=t/2, h=cw);
      } else {
        bh=t;
        translate([id/2-t,-co,-8]) cube([t,cw+co,8]);
        translate([id/2-bh,0.1,-8-t]) cube([bh,cw,t]);
        translate([id/2-t,0.1,-8-t/2]) rotate([-90,0,0]) cylinder(r=t/2, h=cw);
      }
      translate([0,-co-t,-15+t]) cube([id/2,t,15]);
      translate([0,-co,0]) cube([id/2,cw+co,t]);
    }
    translate([0,0,-t+1.5]) cylinder(r=cr,h=t+2);
  }
}