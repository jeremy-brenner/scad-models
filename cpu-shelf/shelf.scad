include <../modules/hex-grid.scad>;

$fn=32;

c=25.4;
caseD=[for (x=[17.83,18.35,9.06]) x*c];
poleL=21*c;
poleR=7;

hexInradius = 20;
supportThickness = 1.6;
supportWidth = poleR*2+supportThickness*2;

xCells = 7;
yCells = 5;
screwR = 1.8;

skipCells = [ 
  [2,4], [2,5],
  [3,2], [3,3], [3,4],
  [4,2], [4,3], [4,4], [4,5],
  [5,2], [5,3], [5,4],
  [6,2], [6,3], [6,4], [6,5]
];

cappedCells = [
];

difference() {
  union() {
    // cylinder(r=poleR+supportThickness,h=10+supportThickness);
    cylinder(r=poleR+supportThickness*2,h=10, $fn=6);
    // translate([0,0,10+supportThickness]) scale([1,1,0.25]) sphere(r=poleR+supportThickness);
  }
  translate([0,0,-1]) cylinder(r=poleR,h=11);
  translate([0,50,5]) rotate([90,0,0]) cylinder(r=screwR,h=100);

}

// difference() {
// cube([20,10,20]);
// translate([10,-19,10]) pole();
// }

// corner();
// poleCorner();

// poleSquare();

//prettyRender();

module prettyRender() {
  color("black") corner();
  mirror([1,0,0]) color("black") corner();
  mirror([0,1,0]) color("black") corner();
  mirror([0,1,0]) mirror([1,0,0]) color("black") corner();

translate([0,0,10]) color("grey") poleSquare();

  color("gray") translate([0,0,20]) case();

}

module corner() {
  supportPos = [-139,-131.6];
  translate([-149,-155,0]) 
  //translate([-130,-116,0]) 
  difference() {
    union() {
      translate([supportPos[0],supportPos[1],0]) {
        cube([supportWidth,228,supportWidth]);
        cube([250.5,supportWidth,supportWidth]);
      }


      hexGrid(hexInradius,supportWidth,supportThickness,xCells,yCells,skipCells,cappedCells);
    }
    translate([supportPos[0]+supportWidth/2,supportPos[1]+supportWidth/2,supportWidth/2]) {
      translate([0,20,-50]) cylinder(r=screwR,h=100);
      translate([20,0,-50]) cylinder(r=screwR,h=100);

      poleCorner();
    }
  }
   
}

module poleCorner() {
  translate([0,poleR+supportThickness,0]) pole();
  rotate([0,0,-90]) translate([0,poleR+supportThickness,0]) pole();
  translate([0,0,-20]) rotate([90,0,0]) pole(); 
}

module poleSquare() {
  poleO=7;
  translate([-(poleL+poleO*2+poleR)/2,-(poleL+poleO*2+poleR)/2,0]) {
    translate([0,poleO,0]) pole();
    rotate([90,0,0]) pole();
  }    
  rotate([0,0,90]) translate([-(poleL+poleO*2+poleR)/2,-(poleL+poleO*2+poleR)/2,0]) {
    translate([0,poleO,0]) pole();
    rotate([90,0,0]) pole();
  } 
  rotate([0,0,180]) translate([-(poleL+poleO*2+poleR)/2,-(poleL+poleO*2+poleR)/2,0]) {
    translate([0,poleO,0]) pole();
    rotate([90,0,0]) pole();
  } 
  rotate([0,0,270]) translate([-(poleL+poleO*2+poleR)/2,-(poleL+poleO*2+poleR)/2,0]) {
    translate([0,poleO,0]) pole();
    rotate([90,0,0]) pole();
  } 
}


module pole() {
  rotate([-90,0,0]) cylinder(r=poleR, h=poleL);
}
module case() {
  translate([-caseD[0]/2,-caseD[1]/2,0]) cube(caseD);
}
