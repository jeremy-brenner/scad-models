include <../modules/hex-grid.scad>;


boxX=180;
boxY=180;
boxZ=60;
t=2;
mt=5;
$fn=64;

terminalMountPos = [13,80,0];
cptMountPos = [83,75,0];
psuMountPos = [120,10,0];
relayMountPos = [100,120,0];
arduinoMountPos = [10,125,0];

// boxBase();
translate([0,0,boxZ+t*2]) mirror([0,0,1]) boxLid();

module boxLid() {
    difference() {
      intersection() {
        translate([boxX/2,boxY/2,0]) hexGrid(8,t+1,t,15,12,[],[]);
        translate([0,0,-0.1]) cube([boxX,boxY,t+1.2]);
      }
      translate([boxX/2,boxY/2,-1]) cylinder(r=8,h=boxZ,$fn=6);
    }
    difference() {
      translate([-t,-t,0]) cube([boxX+t*2,boxY+t*2,8]);
      translate([0,0,-0.1]) cube([boxX,boxY,boxZ+1]);
    }
    translate([boxX/2,boxY/2,0]) difference() {
      cylinder(r=8,h=t+1,$fn=6);
      translate([0,0,-0.1]) cylinder(r=2.2,h=t+1.2);
    }
}


module boxBase() {
  mountFoot();
  translate([0,boxY-20,0]) mountFoot();

  translate([boxX+20,0,0]) {
    mountFoot();
    translate([0,boxY-20,0]) mountFoot();
  }

  difference() {
    intersection() {
      translate([boxX/2,boxY/2,0]) hexGrid(8,t+1,t,15,12,[],[]);
      translate([t,t,-0.1]) cube([boxX-t*2,boxY-t*2,t+1.2]);
    }
    translate([0,0,-0.1]) {
      translate(terminalMountPos) terminalMount(false);
      translate(cptMountPos) cptMount(false);
      translate(psuMountPos) psuMount(false);
      translate(relayMountPos) relayMount(false);
      translate(arduinoMountPos) arduinoMount(false);
      translate([boxX/2,boxY/2,0]) cylinder(r=8,h=boxZ,$fn=6);
    }
  }

  difference() {
    cube([boxX,boxY,boxZ]);
    translate([t,t,-0.1]) cube([boxX-t*2,boxY-t*2,boxZ+1]);
    translate([10,-0.1,0]) cube([68,t+0.2,boxZ]);
    translate([-5,boxY*0.5,30]) rotate([0,90,0]) cylinder(r=10,h=1000,$fn=6);
    translate([-5,boxY*0.165,30]) rotate([0,90,0]) cylinder(r=10,h=1000,$fn=6);
    translate([-5,boxY*0.33,30]) rotate([0,90,0]) cylinder(r=10,h=1000,$fn=6);
    translate([-5,boxY*0.66,30]) rotate([0,90,0]) cylinder(r=10,h=1000,$fn=6);
    translate([-5,boxY*0.825,30]) rotate([0,90,0]) cylinder(r=10,h=1000,$fn=6);

  }


  translate([10,0,0]) powerJack();

  translate(terminalMountPos) terminalMount();
  translate(cptMountPos) cptMount();
  translate(psuMountPos) psuMount();
  translate(relayMountPos) relayMount();
  translate(arduinoMountPos) arduinoMount();


  translate([boxX/2,boxY/2,0]) difference() {
    cylinder(r=8,h=boxZ,$fn=6);
    translate([0,0,-0.1]) cylinder(r=4.2,h=30,$fn=6);
    cylinder(r=2.2,h=boxZ+0.1);
  }
}

module mountFoot() {
  translate([-20,0,0]) difference() {
    cube([20,20,10]);
    translate([10,10,-0.1]) cylinder(r=2.2,h=10.2);
  }
}

module arduinoMount(holes=true) {
  difference() {
    union() {
      mountPeg(mt+2,holes);
      translate([63,0,0]) mountPeg(mt+2,holes);
      translate([0,43,0]) mountPeg(mt+2,holes);
      translate([63,43,0]) mountPeg(mt+2,holes);
    }
    translate([1.5,1.5,5]) cube([60,40,2.1]);
  }
}

module relayMount(holes=true) {
  translate([68,0,0]) mountPeg(mt,holes);
  translate([0,48,0]) mountPeg(mt,holes);
  translate([68,48,0]) mountPeg(mt,holes);
  translate([0,0,0]) mountPeg(mt,holes);  
}

module psuMount(holes=true) {
  translate([48,0,0]) mountPeg(mt,holes);
  translate([0,76,0]) mountPeg(mt,holes);
  translate([48,76,0]) mountPeg(mt,false);
  translate([0,0,0]) mountPeg(mt,false);  
}


module mountPeg(h,hole=true) {
  difference() {
    cylinder(r=5,h=h);
    if(hole) {
      screwHole(h);
    }
  }
}

module cptMount(holes=true) {
  rotate([0,0,-90]) terminalMount(holes);
}

module terminalMount(holes=true) {
  screwMountPiece(holes);
  translate([53,0,0]) screwMountPiece(holes);
}

module screwMountPiece(hole=true) {
  difference() {
    cube([10,22,mt]);
    if(hole) {
      translate([5,11,0]) rotate([0,0,90]) screwHole(mt);
    }
  }
}

module screwHole(h) {
  translate([0,0,-0.1]) {
    cylinder(r=3.2,h=3.1,$fn=6);
    cylinder(r=1.7,h=h+0.2);
  }
}

module powerJack() {
  jackW=48;
  jackH=28;

  difference() {
    cube([68,t,boxZ]);
    translate([10,-0.1,16]) {
      translate([jackW/2,0,20+jackH/2]) rotate([-90,0,0]) cylinder(r=2,h=10);
      translate([jackW/2,0,-20+jackH/2]) rotate([-90,0,0]) cylinder(r=2,h=10);
      cube([jackW,10,28]);
    }
  }
  translate([5-t/2,0,0]) cube([t,15,boxZ*0.5]);
  translate([68-5-t/2,0,0]) cube([t,15,boxZ*0.5]);

}


