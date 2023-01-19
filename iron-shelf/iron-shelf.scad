lw=0.4;
lh=0.28;

wt=lw*4;

holeR=8.3;



caseH=220;
caseD=25;


holePositions = [
  [105,0],
  [1,0], 
  [0,219],
  [112,196], 
];

cxd=holePositions[3][0]-holePositions[2][0];
cyd=holePositions[2][1]-holePositions[3][1];

topArmL=150;
armW=cyd+holeR+wt;
bottomArmH=85;


hexR=14;

gridCells = [
  [0,0],[0,1],[0,2],[0,3],[0,4], 
  [1,0],[1,1],[1,2],[1,3],
  [2,0],[2,1],[2,2],[2,3],
  [3,0],[3,1],
  // [4,0],[4,1],
  // [5,0],
];

$fn=64;

// holeTest();
// shelf1();
shelf2();


module hexSupport() {
  intersection() {
    hexGrid(hexR,wt,armW-holeR,gridCells);
    cube([200,200,armW-holeR]);
  }
}


module shelf1() {
    difference() {
      shelf();
      translate([holePositions[0][0], holePositions[0][1], 0]) hole();
      translate([holePositions[1][0], holePositions[1][1], 0]) hole();
    }
    translate([holePositions[0][0], holePositions[0][1], wt]) holeRing();
    translate([holePositions[1][0], holePositions[1][1], wt]) holeRing();
}

module shelf2() {
    difference() {
      translate([0,holePositions[2][1],0]) mirror([0,1,0]) shelf();
      translate([holePositions[2][0], holePositions[2][1], 0]) hole();
      translate([holePositions[3][0], holePositions[3][1], 0]) hole();
    }
    translate([holePositions[2][0], holePositions[2][1], wt]) holeRing();
    translate([holePositions[3][0], holePositions[3][1], wt]) holeRing();
}

module shelf() {
  
  hull() {
    cylinder(r=holeR+wt,h=wt);
    translate([cxd,cyd,0]) cylinder(r=holeR+wt,h=wt);
    translate([cxd,0,0]) cylinder(r=holeR+wt,h=wt);
    translate([-holeR-wt,cyd,0]) cube([holeR+wt,holeR+wt,wt]);
  }
  translate([-holeR-wt-caseD,0,0]) cube([caseD,armW,wt]);
  
  translate([-holeR-wt-caseD-topArmL+wt,0,caseH]) cube([topArmL,armW,wt*2]);

  armT=10;
  translate([-holeR-armT-caseD,0,0]) cube([armT,armW,caseH]);
  translate([-holeR-armT-caseD,holeR,-bottomArmH]) cube([armT,armW-holeR,bottomArmH]);

  translate([-holeR-caseD-wt/2,armW,0]) rotate([90,90,0]) hexSupport();

}




module holeTest() {
  scale([1,1,0.5]) holePositions() holeRing();
  
  difference() {
    testPlate() cylinder(r=4,h=lw*2);
    holePositions() hole();
  }

}


module testPlate() {
  holeCount = len(holePositions);
  for (i = [ 0 : holeCount - 1 ] ) {
    i2 = (i+1)%holeCount;
    hull() {
      translate([holePositions[i][0], holePositions[i][1], 0]) children();
      translate([holePositions[i2][0], holePositions[i2][1], 0]) children();
    }
  }
}

module holePositions() {
  for (i = [ 0 : len(holePositions) - 1 ] ) {
    translate([holePositions[i][0], holePositions[i][1], 0]) children();
  }
}

module holeRing() {
  difference() {
    cylinder(r=holeR+wt,h=wt*2);
    hole();
  }
}

module hole() {
  translate([0,0,-0.5]) cylinder(r=holeR,h=wt*2+1);
}




module hexGrid(hr,d,h,renderCells) {
  for (i = [ 0 : len(renderCells) - 1 ] ) {
    x = renderCells[i][0];
    y = renderCells[i][1];
    difference() {
      hexPositioned(hr+d,-d,h,x,y);
      translate([0,0,-0.1]) hexPositioned(hr,d,h+0.2,x,y);
    }
  }
}

module hexPositioned(hr,d,h,ix,iy) {
  cr=circumradius(hr);
  even=abs(ix%2);
  translate([(hr+d/2)*sqrt(3)*ix,(hr+d/2)*even,0]) translate([0,(hr*2+d)*iy,0]) cylinder(r=cr,h=h,$fn=6);
}

function circumradius(hr) = hr/(sqrt(3)/2);