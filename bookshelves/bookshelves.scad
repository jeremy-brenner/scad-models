
hole=true;
grid=false;
half=false;
holeCount=3;
shelfBoards=2;

main(hole,grid,holeCount,shelfBoards,half);

module main(hole,grid,holeCount,shelfBoards,half) {
  boardW=183;
  boardT=19;
  boardL=700;

  shelfW = boardW*shelfBoards;

  frameD=40;

  frameH=340;

  thickness=4;

  gridW = gridW(supportW(shelfW,thickness),frameH,holeCount,thickness);
  holeR = holeR(frameH,holeCount,thickness);
  
  echo(gridW,supportW(shelfW,thickness));
  
  frameW=gridW-holeR*2; 

  frameColor="#000000";
  shelfColor="#fee1a7";

  //   intersection() {
  //   translate([0,150,-2]) cube([200,40,50]);
  //   frameWithShelfHole(frameW,frameH,frameD,thickness,holeCount,shelfW,boardT);

//  color("red") nukaGrid(frameD,supportW(shelfW,thickness),frameH,holeCount,thickness,hole);
  difference() {
    if(hole) {
      color(frameColor) frameWithShelfHole(frameW,frameH,frameD,thickness,holeCount,shelfW,boardT);
    } else {
      color(frameColor) frame(frameW,frameH,frameD,thickness,holeCount,shelfW);
    }
    if(half) {
      color("red") nukaGrid(frameD,supportW(shelfW,thickness),frameH,holeCount,thickness,hole);
    }
    color("red") frameScrews(frameW,frameD,frameH,thickness);
  }
   

  if(grid) {     
    hexGrid(frameD,supportW(shelfW,thickness),frameH,holeCount,thickness);
  }
}

module frameScrews(frameW,frameD,frameH,thickness) {
  translate([frameW*0.25,0,frameD*0.25]) frameScrewHole(thickness);
  translate([frameW*0.25,0,frameD*0.75]) frameScrewHole(thickness);
  translate([frameW*0.75,0,frameD*0.25]) frameScrewHole(thickness);
  translate([frameW*0.75,0,frameD*0.75]) frameScrewHole(thickness);
  translate([frameW*0.25,frameH,frameD*0.25]) rotate([180,0,0]) frameScrewHole(thickness);
  translate([frameW*0.25,frameH,frameD*0.75]) rotate([180,0,0]) frameScrewHole(thickness);
  translate([frameW*0.75,frameH,frameD*0.25]) rotate([180,0,0]) frameScrewHole(thickness);
  translate([frameW*0.75,frameH,frameD*0.75]) rotate([180,0,0]) frameScrewHole(thickness);
}

module frameScrewHole(thickness) {
  rotate([90,0,0]) translate([0,0,-thickness-1]) {
    cylinder(r=1.75,h=thickness+2,$fn=32);
    cylinder(r=4,h=3,$fn=32);
  };
}

module frameWithShelfHole(frameW,frameH,frameD,thickness,holeCount,shelfW,boardT) {
  difference() {
    union() {
      frame(frameW,frameH,frameD,thickness,holeCount,shelfW);
      shelfthicknessupport(frameW,thickness,frameH,frameD,shelfW,boardT);
    }
    shelfHole(frameW,thickness,frameH,frameD,shelfW,boardT,shelfBoards);
  }
}

module shelfthicknessupport(frameW,thickness,frameH,frameD,shelfW,boardT) {
  supportW=supportW(shelfW,thickness);
  translate([(frameW-supportW)/2,(frameH-2-boardT-thickness*2)/2,0]) {  
    translate([(supportW-frameW)/2,boardT/2+1+thickness/2,0]) cube([frameW,thickness,frameD]);
    cube([supportW,boardT+2+thickness*2,frameD]);
  }
}

module shelfHole(frameW,thickness,frameH,frameD,shelfW,boardT,shelfBoards) {
  boardW=shelfW/shelfBoards;
  translate([(frameW+2-shelfW-thickness)/2,(frameH+2-boardT-thickness)/2,-1]) 
    union() {
      cube([shelfW+2,boardT+2,frameD+2]);
      for ( i = [0 : shelfBoards-1] ){ 
        translate([i*boardW+boardW/2,0,frameD/2+1]) shelfScrewHole(boardT,thickness);
      }
    }
}

module shelfScrewHole(boardT,thickness) {
  holeH=boardT+2+thickness*2+0.1;
  hOffset=(holeH-(boardT+2))/2;
  translate([0,holeH-hOffset,0]) rotate([90,0,0]) {
    cylinder(r=1.75,h=holeH,$fn=32);
    cylinder(r=3,h=3,$fn=32);
    translate([0,0,holeH-3]) cylinder(r=3.25,h=3,$fn=6);
  }
}

module frame(frameW,frameH,frameD,thickness,holeCount,shelfW) {
  difference() {
    cube([frameW,frameH,frameD]);
    translate([thickness,thickness,-1]) cube([frameW-thickness*2,frameH-thickness*2,frameD+2]);
  } 
  difference() {
    cube([frameW,frameH,frameD]);
    hexGrid(frameD,supportW(shelfW,thickness),frameH,holeCount,thickness);
  }
}

module nukaGrid(frameD,frameW,frameH,holeCount,thickness,hole) {
  holeR = holeR(frameH,holeCount,-0.2);
  holeD = holeD(frameH,holeCount,thickness);
  holeRowD = holeRowD(frameH,holeCount);
  holeColNum = holeColNum(frameW,frameH,holeCount,thickness);
  hexPositioned(0,0,holeRowD,holeD,holeR,frameD,frameW);
  hexPositioned(1,0,holeRowD,holeD,holeR,frameD,frameW);
  hexPositioned(2,0,holeRowD,holeD,holeR,frameD,frameW);
  hexPositioned(0,1,holeRowD,holeD,holeR,frameD,frameW);
  hexPositioned(1,1,holeRowD,holeD,holeR,frameD,frameW);
  hexPositioned(2,1,holeRowD,holeD,holeR,frameD,frameW);
  hexPositioned(3,1,holeRowD,holeD,holeR,frameD,frameW);
  hexPositioned(0,2,holeRowD,holeD,holeR,frameD,frameW);
  hexPositioned(1,2,holeRowD,holeD,holeR,frameD,frameW,true);
}

module hexGrid(frameD,frameW,frameH,holeCount,thickness) {
  
  holeR = holeR(frameH,holeCount,thickness);
  holeD = holeD(frameH,holeCount,thickness);
  holeRowD = holeRowD(frameH,holeCount);
  holeColNum = holeColNum(frameW,frameH,holeCount,thickness);

  for ( c = [0 : holeColNum] ){ 
    for ( r = [0 : holeCount] ){ 
      hexPositioned(r,c,holeRowD,holeD,holeR,frameD,frameW);
    }
  }
}

module hexPositioned(r,c,holeRowD,holeD,holeR,frameD,frameW,half=false) {
  even=c%2;
  gridW = frameW+holeR*2;
  holeOffset=(gridW-frameW)/2-holeR;
  x=holeRowD*c-holeOffset;
  y=holeD/2+holeD*r+even*-holeD/2;
 
  translate([x,y,0]) hex(holeR,frameD,half);
}

module hex(holeR,frameD,half=false) {
  translate([0,0,-1]) difference() {
    cylinder(r=holeR,h=frameD+2,$fn=6);
    if(half) { 
      rotate([0,0,-60]) translate([-holeR,0,-1]) cube([holeR*2,holeR,frameD+4]);
    }
  }
}

module shelf() translate([(frameW-shelfW)/2,(frameH+boardT)/2,-4]) rotate([180,-90,0]) {
  board();
  translate([0,0,boardW]) board();
}

module board() {
  cube([boardL,boardT,boardW]);
}

function holeR(frameH,holeCount,thickness) = (frameH/holeCount-thickness)/sqrt(3);
function holeD(frameH,holeCount,thickness) = sqrt(3)*holeR(frameH,holeCount,thickness)+thickness;
function holeRowD(frameH,holeCount) = holeR(frameH,holeCount,0)*1.5;
function holeColNum(frameW,frameH,holeCount,thickness) = floor(frameW/holeRowD(frameH,holeCount)+1)+(floor(frameW/holeRowD(frameH,holeCount)+1)%2);
function gridW(frameW,frameH,holeCount,thickness) = holeRowD(frameH,holeCount)*holeColNum(frameW,frameH,holeCount,thickness)+holeR(frameH,holeCount,thickness)*2;
function supportW(shelfW,thickness) = shelfW+2+thickness*2;