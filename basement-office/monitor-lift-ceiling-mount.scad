use <./monitor-lift-poles.scad>;
use <../modules/screwHoles.scad>;

$fn=32;
poleD=21;
mWidth=40;
mThicks=20;
baseT=3;
bracketL=400;
bracketT=5;
bracketScrewTrackLen=140;
wingW=bracketT/2;
grooveT=2;
mountR=31;

mountBracketScrewThingL=120;
bracketScrewC=3;
bracketScrewD=mountBracketScrewThingL/bracketScrewC;

innerW=mWidth-wingW*2-0.5;

// intersection() {
//   mountDisk(true);
//   cylinder(r=mountR,h=mThicks/2);
// }
// intersection() {
//   mountDisk(false);
//   cylinder(r=mountR,h=mThicks/2);
// }

// translate([mountR*2+1,0,0]) mountDisk(false);

// color("red") cylinder(r=50,h=2);
// mountBracket();

// translate([-10,0,bracketT*2]) rotate([0,180,0]) mountBracketScrewThing();

// screwTest();

// translate([50,0,0]) pipeHolder();

intersection() {
  bThing();
  //translate([-20,-11/2,-1]) cube([20000,11,20000]);
}

module bThing() {
  d=11.25;
  n=31.75;
  c=2;
  h=6;
  translate([15.5+(n-15.5)/2,d/2,0]) cylinder(r=3,h=h);

  for ( i = [0 : c-1] ){ 
    translate([n*i,0,0]) {
      bBit(h);
      translate([0,d,0]) bBit(h);
    }
  }

  translate([0,-1.4,0]) cube([15.5+n*(c-1),d+1.4*2,2]);
}

module bBit(h) {
  hull() {
    r=1.4;
    w=15.5;
    cylinder(r=r,h=h);
    translate([w,0,0]) cylinder(r=r,h=h);
  }
}

module pipeHolder() {
  t=12;
  difference() {
    cube([innerW,t,bracketT*2]);
    translate([innerW/2-poleD/2,t,-1]) rotate([0,0,-90]) rotate([0,-90,0]) poles(poleD,false,1);
    translate([innerW/2,-0.1,5]) rotate([-90,0,0]) {
      cylinder(r=4.2,h=3.6,$fn=6);
      cylinder(r=2.2,h=t+2);
    }
  }
}


module screwTest() {
  difference() {
    cylinder(r=5,h=10);
    woodScrewNum8();
    translate([0,-50,-1]) cube([100,100,100]);
  }
}

module grooves(w,l,t) {
  c=floor(l/t);
  intersection() {
    cube([w,l,t]);
    translate([0,t/2,0]) for ( i = [0 : c] ){
      translate([0,t*i,0]) rotate([45,0,0]) translate([0,-t/2,-t/2]) cube([w,t,t]);
    }
  }
}

module mountBracketScrewThing() {
  translate([0,0,bracketT])  difference() {
    union() {
      cube([innerW,mountBracketScrewThingL,bracketT]);
      mirror([0,0,1]) grooves(innerW,mountBracketScrewThingL,grooveT);
    }
    for ( i = [0 : bracketScrewC-1] ){
      translate([innerW/2,bracketScrewD*i+bracketScrewD/2,-2]) woodScrewNum8();
    }
  }
}

module mountBracket() {
  grooveLen=bracketScrewTrackLen+20;
  difference() {
    union() {
      cube([mWidth,bracketL,bracketT]);
      cube([wingW,bracketL,bracketT*3]);
      translate([mWidth/2-wingW/2,grooveLen,0]) cube([wingW,bracketL-grooveLen-30,bracketT*3]);
      translate([mWidth-wingW,0,0]) cube([wingW,bracketL,bracketT*3]);
      translate([0,0,bracketT]) grooves(mWidth,grooveLen,grooveT);
      translate([0,bracketL-10,0]) cube([mWidth,10,bracketT*3]);

    }
    hull() {
      translate([mWidth/2,0,-2]) cylinder(r=2.1,h=10);
      translate([mWidth/2,10+bracketScrewTrackLen,-2]) cylinder(r=2.1,h=10);
    }
    translate([mWidth/2-poleD/2,bracketL-10,-1]) rotate([0,0,-90]) rotate([0,-90,0]) poles(poleD,false);
    translate([mWidth/2-poleD/2,bracketL-10,bracketT]) rotate([0,0,-90]) rotate([0,-90,0]) poles(poleD,false,1);
    translate([mWidth/2,bracketL-11,bracketT*2]) rotate([-90,0,0]) cylinder(r=2.2,h=12);
  }
}

module mountDisk(nut=true) {
  vd=10;
  sz= nut ? 0: -10;

  difference() {
    yw=poleD+mThicks;
    cylinder(r=mountR,h=mThicks);
    translate([-100,-poleD/2,mThicks/2]) color("grey") poles(poleD,false,1);
    translate([0,0,sz]) {
      machineScrew();
      translate([0,25,0]) machineScrew();
      rotate([0,0,45/2]) translate([0,25,0]) machineScrew();
      rotate([0,0,-45/2]) translate([0,25,0]) machineScrew();
      translate([0,-25,0]) machineScrew();
      rotate([0,0,45/2]) translate([0,-25,0]) machineScrew();
      rotate([0,0,-45/2]) translate([0,-25,0]) machineScrew();
    }
  }
}

module machineScrew() {
  translate([0,0,-0.1]) cylinder(r=4.2,h=4.1,$fn=6);
  cylinder(r=2.25,h=50);
}
