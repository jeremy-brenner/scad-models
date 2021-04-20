
hole=true;
grid=false;
piece=-1; // [-1:whole, 0:first, 1:second, 2:shelfHole, 3: mock]

holeCount=4;
shelfBoards=2;
frameDepth=30;

frameColor="#000000";
shelfColor="#edc65a";

debug=false;

main(hole,grid,holeCount,shelfBoards,piece,frameDepth,debug);

module main(hole,grid,holeCount,shelfBoards,piece,frameDepth,debug) {
  boardW=185;
  boardT=19;
  boardL=609;
  shelfFudge=0.5;

  shelfW = boardW*shelfBoards;

  frameH=340;

  thickness=3.2;

  gridW = gridW(supportW(shelfW,thickness,shelfFudge),frameH,holeCount,thickness);
  holeR = holeR(frameH,holeCount,thickness);
    
  frameW=supportW(shelfW,thickness,shelfFudge)+16;

  if(piece<2) {
    difference() {
      finishedFrame(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,shelfBoards,shelfFudge,hole);

      if(piece > -1) {
        color("red") nukaGrid(frameDepth,frameW,frameH,holeCount,thickness,hole,piece);
      }
    }
  }

  if(piece==3) rotate([90,0,0]) {
    doubleShelfRow(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,boardL,shelfBoards,shelfFudge);
    translate([0,frameH,0]) singleShelfRow(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,boardL,shelfBoards,shelfFudge);
    translate([0,frameH*2,0]) doubleShelfRow(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,boardL,shelfBoards,shelfFudge);
    translate([0,frameH*3,0]) singleShelfRow(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,boardL,shelfBoards,shelfFudge);
    translate([0,frameH*4,0]) doubleShelfRow(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,boardL,shelfBoards,shelfFudge);
    translate([0,frameH*5,0]) singleShelfRow(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,boardL,shelfBoards,shelfFudge);
    translate([0,frameH*6,0]) doubleShelfRow(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,boardL,shelfBoards,shelfFudge);
  }

  if(piece==2) {
    difference() {
      shelfthicknessupport(frameW,thickness,frameH,frameDepth,shelfW,boardT,shelfFudge);
      shelfHole(frameW,thickness,frameH,frameDepth,shelfW,boardT,shelfBoards,shelfFudge);
      translate([-1,0,-1]) cube([frameW/2+1,500,500]);
    }
  }

  if(grid) {     
    hexGrid(frameDepth,frameW,frameH,holeCount,thickness);
  }
}

module finishedFrame(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,shelfBoards,shelfFudge,hole) {
  difference() {
    color(frameColor) {
      frame(frameW,frameH,frameDepth,thickness,holeCount,shelfW);
      if(hole) {
        shelfthicknessupport(frameW,thickness,frameH,frameDepth,shelfW,boardT,shelfFudge);
      }
    }  
    if(hole) {
      shelfHole(frameW,thickness,frameH,frameDepth,shelfW,boardT,shelfBoards,shelfFudge);
    }
    color("red") frameScrews(frameW,frameDepth,frameH,thickness);
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

module shelfthicknessupport(frameW,thickness,frameH,frameD,shelfW,boardT,shelfFudge) {
  supportW=supportW(shelfW,thickness,shelfFudge);
  translate([(frameW-supportW)/2,(frameH-shelfFudge-boardT-thickness*2)/2,0]) {  
    translate([(supportW-frameW)/2,boardT/2+shelfFudge/2+thickness/2,0]) cube([frameW,thickness,frameD]);
    cube([supportW,boardT+shelfFudge+thickness*2,frameD]);
  }
}

module shelfHole(frameW,thickness,frameH,frameD,shelfW,boardT,shelfBoards,shelfFudge) {
  boardW=shelfW/shelfBoards;
  translate([(frameW-shelfW-shelfFudge)/2,(frameH-boardT-shelfFudge)/2,-1]) 
    union() {
      cube([shelfW+shelfFudge,boardT+shelfFudge,frameD+2]);
      for ( i = [0 : shelfBoards-1] ){ 
        translate([i*boardW+boardW/2,0,frameD/2+1]) shelfScrewHole(boardT,thickness,shelfFudge);
      }
    }
}

module shelfScrewHole(boardT,thickness,shelfFudge) {
  holeH=boardT+shelfFudge+thickness*2+0.1;
  hOffset=(holeH-(boardT+shelfFudge))/2;
  translate([0,holeH-hOffset,0]) rotate([90,0,0]) {
    cylinder(r=1.75,h=holeH,$fn=32);
    cylinder(r=3,h=thickness/2,$fn=32);
    translate([0,0,holeH-thickness/2]) cylinder(r=3.25,h=thickness/2,$fn=6);
  }
}

module frame(frameW,frameH,frameD,thickness,holeCount,shelfW) {
  difference() {
    cube([frameW,frameH,frameD]);
    translate([thickness,thickness,-1]) cube([frameW-thickness*2,frameH-thickness*2,frameD+2]);
  } 
  difference() {
    cube([frameW,frameH,frameD]);
    hexGrid(frameD,frameW,frameH,holeCount,thickness);
  }
}

module nukaGrid(frameD,frameW,frameH,holeCount,thickness,hole,piece) {
  holeR = holeR(frameH,holeCount,-0.2);
  holeD = holeD(frameH,holeCount,thickness);
  holeRowD = holeRowD(frameH,holeCount);
  holeColNum = holeColNum(frameW,frameH,holeCount,thickness);
  gridOffset=(holeRowD*holeColNum-frameW)/-2;

  cstart=(1-piece)*(holeColNum/2+1);
  cend=holeColNum/2+(1-piece)*holeColNum/2;
  for ( c = [cstart : cend] ){ 
    for ( r = [0 : holeCount] ){ 
      hexPositioned(r,c,holeRowD,holeD,holeR,frameD,frameW,gridOffset);
    }
  }

}

module hexGrid(frameD,frameW,frameH,holeCount,thickness) {
  
  holeR = holeR(frameH,holeCount,thickness);
  holeD = holeD(frameH,holeCount,thickness);
  holeRowD = holeRowD(frameH,holeCount);
  holeColNum = holeColNum(frameW,frameH,holeCount,thickness);
  
  gridOffset=(holeRowD*holeColNum-frameW)/-2;
  
  for ( c = [0 : holeColNum] ){ 
    for ( r = [0 : holeCount] ){ 
      hexPositioned(r,c,holeRowD,holeD,holeR,frameD,frameW,gridOffset);
    }
  }
}

module hexPositioned(r,c,holeRowD,holeD,holeR,frameD,frameW,gridOffset) {
  even=c%2;
  x=holeRowD*c+gridOffset-holeRowD/2;
  y=holeD/2+holeD*r+even*-holeD/2;
 
  translate([x,y,0]) hex(holeR,frameD);
}

module hex(holeR,frameD) {
  translate([0,0,-1]) cylinder(r=holeR,h=frameD+2,$fn=6);
}

module shelfMock(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,boardL,shelfBoards,shelfFudge) {  
  finishedFrame(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,shelfBoards,shelfFudge,true);
  color(shelfColor) translate([11.5,160.5,0]) cube([shelfW,boardT,boardL]);
  translate([0,0,boardL-frameDepth]) finishedFrame(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,shelfBoards,shelfFudge,true);
}

module doubleShelfRow(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,boardL,shelfBoards,shelfFudge) {
  shelfMock(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,boardL,shelfBoards,shelfFudge);
     
 // color(shelfColor) translate([11.5,160.5,boardL-frameDepth]) cube([shelfW,boardT,boardL]);

  translate([0,0,boardL*2-frameDepth*2]) shelfMock(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,boardL,shelfBoards,shelfFudge);
}

module singleShelfRow(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,boardL,shelfBoards,shelfFudge) {
  finishedFrame(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,shelfBoards,shelfFudge,false);
  //  color(shelfColor) translate([11.5,160.5,0]) cube([shelfW,boardT,boardL]);
  //  color(shelfColor) translate([11.5,160.5,boardL*2-frameDepth*2]) cube([shelfW,boardT,boardL]);

  translate([0,0,boardL-frameDepth]) shelfMock(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,boardL,shelfBoards,shelfFudge);
  translate([0,0,boardL*3-frameDepth*3]) finishedFrame(frameW,frameH,frameDepth,thickness,holeCount,shelfW,boardT,shelfBoards,shelfFudge,false);
}

function holeR(frameH,holeCount,thickness) = (frameH/holeCount-thickness)/sqrt(3);
function holeD(frameH,holeCount,thickness) = sqrt(3)*holeR(frameH,holeCount,thickness)+thickness;
function holeRowD(frameH,holeCount) = holeR(frameH,holeCount,0)*1.5;
function holeColNum(frameW,frameH,holeCount,thickness) = floor(frameW/holeRowD(frameH,holeCount)+1)+(floor(frameW/holeRowD(frameH,holeCount)+1)%2);
function gridW(frameW,frameH,holeCount,thickness) = holeRowD(frameH,holeCount)*holeColNum(frameW,frameH,holeCount,thickness)+holeR(frameH,holeCount,thickness)*2;
function supportW(shelfW,thickness,shelfFudge) = shelfW+shelfFudge+thickness*2;