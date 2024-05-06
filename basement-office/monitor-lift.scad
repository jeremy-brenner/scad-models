use <./monitors.scad>;
use <./monitor-lift-poles.scad>;
include <../modules/hex-grid.scad>;


$fn=32;

p=0.61; // [0:0.1:1]
//p = $t*2 < 1 ? $t*2 : 1-($t*2-1);

longArmLength=444.5;
middleArmLength=longArmLength*0.5;
shortArmLength=longArmLength*0.36;
longArmHoleDistance=longArmLength*0.5625;
monitorPostHoleDistance=longArmLength*0.4822;

minSA=6.5;
maxSA=70;


mOffset=250;

bearingR=5.5;
bearingT=4;
rodR=2.1;


armR=11;
postR=19;
postL=922;
armD=33;
thickness=20;
lineW=2;
poleD=-21;



// lift(p);
// translate([720,0,0]) rotate([0,-32,0]) color("blue") cube([5,5,1200]);

// rotate([0,0,-45]) rotate([90,0,0]) pArm(longArmLength,longArmHoleDistance); 

// pArm(middleArmLength); 
// pArm(shortArmLength);

// postDrillTemplate();


// poles(poleD);

// bottomThingA();

// bottomThingB();
// translate([armD/2,0,-17]) color("red") rotate([0,90,0]) cylinder(r=0.2,h=217);
endStop();

// board();



// translate([-175,0,0]) color("red") {
//   translate([153,0,0]) cylinder(r=2,h=50);
//   translate([230,0,0]) cylinder(r=2,h=50);
//   translate([399.486,0,0]) cylinder(r=2,h=50);
//   translate([699.584,0]) cylinder(r=2,h=50);
// }

// spacer();
// bearingSpacer();
// rodSpacer();

module rodSpacer() {
  difference() {
    cylinder(r=rodR+0.25+2,h=postR*2);
    translate([0,0,-1]) cylinder(r=rodR+0.25,h=postR*2+2);
  }
}

module bearingSpacer() {
  spacerH=thickness-bearingT*2;
  difference() {
    cylinder(r=bearingR-0.5, h=spacerH);
    translate([0,0,-0.1]) cylinder(r=rodR+0.5, h=spacerH+0.2);
  }
}

module board() {
  translate([-175,-185/2,-30]) color("#c29432") cube([917,185,20]);
}

module spacer() {
  difference() {
    cylinder(r=armR,h=thickness);
    translate([0,0,-0.1]) cylinder(r=rodR+0.5,h=thickness+0.2);
  }
}

module postDrillTemplate() {
  difference() {
    union() {
      cylinder(r=19.5+lineW,h=monitorPostHoleDistance+30);
      translate([0,0,20]) rotate([90,0,0]) translate([0,0,-25]) cylinder(r=5,h=50);
      translate([0,0,20+monitorPostHoleDistance]) rotate([90,0,0]) translate([0,0,-25]) cylinder(r=5,h=50);
    }
    translate([0,0,-1]) cylinder(r=19.5,h=monitorPostHoleDistance+32);
    translate([0,0,20]) rotate([90,0,0]) translate([0,0,-50]) cylinder(r=2.25,h=100);
    translate([0,0,20+monitorPostHoleDistance]) rotate([90,0,0]) translate([0,0,-50]) cylinder(r=2.25,h=100);
  }
}

module pArmHull(l) {
  hull() {
    cylinder(r=armR,h=thickness);
    translate([l,0,0]) cylinder(r=armR,h=thickness);
  }
}

module pArm(l,hp=0, simplify=false) {
  xCells=5;
  yCells=floor(l/7);
  hexInradius = 5;
  
  rotate([-90,0,0]) difference() {
    if(simplify==false) {
      union() {
        intersection() {
          translate([l/2,lineW/2-hexInradius*sqrt(3)/2,0]) rotate([0,0,90]) hexGrid(hexInradius,thickness,lineW,xCells,yCells,[],[]);
          pArmHull(l);
        }
        difference() {
          pArmHull(l);
          translate([0,0,-1]) hull() {
            cylinder(r=armR-lineW,h=thickness+2);
            translate([l,0,0]) cylinder(r=armR-lineW,h=thickness+2);
          }
        }
        difference() {
          cylinder(r=bearingR+lineW,h=thickness);
          translate([0,0,-1]) cylinder(r=bearingR,h=thickness+2);
        }
        translate([l,0,0]) difference() {
          cylinder(r=bearingR+lineW,h=thickness);
          translate([0,0,-1]) cylinder(r=bearingR,h=thickness+2);
        }
        if(hp != 0) {
          translate([hp,0,0]) difference() {
            cylinder(r=rodR+lineW,h=thickness);
            translate([0,0,-1]) cylinder(r=rodR,h=thickness+2);
          }
        }
      }
    } else {
      pArmHull(l);
    }
    translate([0,0,-1]) cylinder(r=bearingR,h=thickness+2);
    translate([l,0,-1]) cylinder(r=bearingR,h=thickness+2);
    translate([hp,0,-1]) cylinder(r=rodR,h=thickness+2);
  }
}

module liftWithOmen(p,mOffset) {
  lift(p, true) {
    rotate([0,90,0])  translate([-90,0,mOffset]) omen();  
  }
}

module liftWithDell(p,mOffset) { 
  lift(p, true) {
    rotate([0,90,0]) translate([-90,0,mOffset]) dell();  
  }
}

module lift(p, simplify=false) {
  sa=(maxSA-minSA)*p+minSA;
  la=angleFor(sa,middleArmLength,longArmHoleDistance);
  da=cos(la)*longArmHoleDistance;
  db=cos(sa)*middleArmLength;
  lx=cos(la)*longArmLength;
  lz=sin(la)*longArmLength;
  mx=da+db-lx+armD;
  dd=sqrt(mx^2+lz^2);
  ba=atan(lz/mx);     
  d1=(dd^2-shortArmLength^2+monitorPostHoleDistance^2)/(2*dd);
  d2=dd-d1;
  taaa=acos(d2/shortArmLength);
  ttaa=acos(d1/monitorPostHoleDistance); 

  translate([0,postR,0]) pArms(sa,middleArmLength,da,db,la,longArmLength,longArmHoleDistance,ba,taaa,shortArmLength, simplify);
  mirror([0,1,0]) translate([0,postR,0]) pArms(sa,middleArmLength,da,db,la,longArmLength,longArmHoleDistance,ba,taaa,shortArmLength, simplify);

  translate([mx-monitorPostHoleDistance, 0, lz]) {
    topThing(ba-ttaa,monitorPostHoleDistance) children();
  }
  translate([0,postR,0]) {
    bottomThingA();
    bottomThingB();
  }
}

module pArms(sa,middleArmLength,da,db,la,longArmLength,longArmHoleDistance,ba,taaa,shortArmLength, simplify=false) {
  translate([armD,0,0]) {
    translate([0,thickness,0]) rotate([0,-sa,0]) pArm(middleArmLength, 0, simplify); 
    translate([da+db,0,0]) mirror([1,0,0]) rotate([0,-la,0]) pArm(longArmLength,longArmHoleDistance, simplify); 
  }
  rotate([0,-(ba+taaa),0]) pArm(shortArmLength, 0, simplify);
}

module bottomThingA() {

  // color("red") {
  //   translate([-armR*2,0,0]) cylinder(r=1,h=50);
  //   translate([armD+armR*2,0,0]) cylinder(r=1,h=50);
  // }
  difference() {
    union() {
      rotate([90,0,0]) hull() {
        cylinder(r=armR+2,h=postR*2);
        translate([armD,0,0]) cylinder(r=armR+2,h=postR*2);
      }
      translate([-armR-2,-postR*2,-26]) cube([armD+(armR+2)*2,postR*2,26]);
    }
    rotate([90,0,0]) translate([0,0,-1]) {
      cylinder(r=rodR+0.25,h=postR*2+2);
      translate([armD,0,0]) cylinder(r=rodR+0.25,h=postR*2+2);
    }
    translate([0,0,-6]) {
      translate([armD/2,-100,0]) poleScrewHole();
      translate([-50,-postR-poleD/2,0]) poles(poleD);
    }
  }
}



module bottomThingB() {
  minla=angleFor(minSA,middleArmLength,longArmHoleDistance);
  minda=cos(minla)*longArmHoleDistance;
  mindb=cos(minSA)*middleArmLength;
  
  maxla=angleFor(maxSA,middleArmLength,longArmHoleDistance);
  maxda=cos(maxla)*longArmHoleDistance;
  maxdb=cos(maxSA)*middleArmLength;

  trackStart=armD+maxda+maxdb;
  trackEnd=armD+minda+mindb;
  length=trackEnd-trackStart;

  width=postR*2;
  tabW=width*0.36;

    middleW=width-tabW*2;
    middleL=length+armR*6;
    middleZ=-armR;

  // echo("HOLE3", 175+trackStart-armR*2 );
  // echo("HOLE4", 175+trackEnd+armR*2 );
  
  thingLen=length+(armR+2)*2+20;

  echo("BTBHD", thingLen/2-20);

  translate([trackStart,0,0]) {
    difference() {
      union() {
        difference() {
          union() {
            rotate([90,0,0]) hull() {
              cylinder(r=armR+2,h=width);
              translate([length,0,0]) cylinder(r=armR+2,h=width);
            }
            translate([-armR-2-10,-postR*2,-26]) cube([thingLen,postR*2,18]);
          }
          rotate([90,0,0]) hull() translate([0,0,-1]) {
            cylinder(r=rodR+0.25,h=width+2);
            translate([length,0,0])  cylinder(r=rodR+0.25,h=width+2);
          }

          hull() {
            translate([2,width/-2,-10]) cylinder(r=(width-tabW*2)/2,h=100);
            translate([-30,width/-2,-10]) cylinder(r=(width-tabW*2)/2,h=100);
          }
          translate([length,0,0]) mirror([1,0,0]) hull() {
            translate([2,width/-2,-10]) cylinder(r=(width-tabW*2)/2,h=100);
            translate([-30,width/-2,-10]) cylinder(r=(width-tabW*2)/2,h=100);
          }
        }
        translate([-33,-tabW-middleW,middleZ]) difference() {
          cube([middleL,middleW,6]);
          translate([5,middleW/2,-0.1]) {
            cylinder(r=3.2,h=3.1,$fn=6);
            cylinder(r=1.7,h=10);
          }
          translate([middleL-5,middleW/2,-0.1]) {
            cylinder(r=3.2,h=3.1,$fn=6);
            cylinder(r=1.7,h=10);
          }
        }
      }

      translate([-23,-width-0.1,-6]) {
        translate([10,0,0]) poleScrewHole();
        translate([thingLen-10,0,0]) poleScrewHole();
        translate([thingLen/2-10,0,0]) poleScrewHole();
        translate([thingLen/2+10,0,0]) poleScrewHole();
      }
      translate([-50,-postR-poleD/2,-6]) poles(poleD);

    }
    translate([-24+thingLen/2,-width,-26]) cube([2,width,18]);
  }
}

module testHole() {
  translate([0,0,-7-4]) rotate([-90,0,0]) {
    cylinder(r=5,h=200);
  }
}

module nub() {
  sphere(r=1);
}


module endStop() {
  sw=6.75;
  ww=1.6;
  tw=sw+ww*2;
  difference() {
    union() {
      difference() {
        translate([2,0,0]) cube([7,sw+ww*2,20]);
        translate([3.5,ww,-0.1]) cube([10,sw,20.2]);
        translate([-0.1,(tw-5)/2,-0.1]) cube([35,5,20.2]);
      //  translate([-0.1,(tw-5)/2,10-1]) cube([2.2,5,3]);
      //  translate([-0.1,(tw-5)/2,20-3.5]) cube([2.2,5,3]);
      }
      translate([6,ww,5])  nub();
      translate([6,ww,15]) nub();
      translate([6,ww+sw,5]) mirror([0,1,0]) nub();
      translate([6,ww+sw,15]) mirror([0,1,0]) nub();
      // dw=2.5;
      // translate([0,tw/2,6.25]) rotate([45,0,0]) translate([0,-dw/2,-dw/2]) cube([3.4,dw,dw]);
      // translate([0,tw/2,14.25]) rotate([45,0,0]) translate([0,-dw/2,-dw/2]) cube([3.4,dw,dw]);
      
      tl=20;
      translate([-tl,0,20]) {
        difference() {
          translate([0,0,-2]) union() {
            cube([tl+9,tw,4]);
            translate([0,tw/2,0]) cylinder(r=tw/2,h=4);
          }
          translate([0,0,-3]) union() {
            translate([0,1,0]) cube([tl+10,tw-2,3]);
            translate([0,tw/2,0]) cylinder(r=tw/2-1,h=3);
          }
          hull() {
            translate([0,tw/2,-0.1]) cylinder(r=1.7,h=2.2);
            translate([tl-3,tw/2,-0.1]) cylinder(r=1.7,h=2.2);
          }
        }
      }
    }
    translate([-2,tw/2-0.25,-1]) cube([100,0.5,100]);
  }
}


module screwTab(width) {
  difference() {
    translate([-armR,-width/2,0]) cube([armR*8,width,armR]);
    translate([0,0,-1]) cylinder(r=2.5,h=armR+2);
  }
}

module topThing(a,o) {
  translate([o,0,0]) rotate([0,-a,0]) translate([-o,0,0]) {
      rotate([0,90,0]) translate([0,0,-20]) cylinder(r=postR,h=postL);
      children();
    }
}

module omen() {
  translate([0,0,600]) mirror([1,0,0]) mirror([0,0,1]) rotate([0,0,90]) omenMonitor();
}

module dell() {
  translate([0,0,600]) mirror([1,0,0]) mirror([0,0,1]) rotate([0,0,90]) dellMonitor();
}


function angleFor(a,l1,l2) = asin((sin(a)*l1)/l2); 
