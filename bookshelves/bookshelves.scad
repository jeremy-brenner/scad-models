boardW=183;
boardT=19;
boardL=585;

shelfW = boardW*2+1;

frameT=40;
frameW=shelfW+20;
frameH=1000;

holeCount = 4;
holeS=4;
holeR = (frameW/holeCount-holeS)/sqrt(3);  //-holeS;

holeD=sqrt(3)*holeR+holeS;
holeRowD=holeR*1.5+holeS;

holeRowNum=frameW/holeD;
holeRowRowNum=frameH/holeRowD+1;

color([0,0,0]) difference() {
    frame();
    translate([35,0,0]) shelfHole();
}
color([0,0,0]) translate([35,0,0]) shelfHoleSupport();
//frame();

color([240/255, 237/255, 216/255]) translate([35,0,0]) shelf();


module shelfHoleSupport() {
  translate([-holeS,(frameW-shelfW-holeS*2)/2,0]) difference() {
      cube([boardT+holeS*2,shelfW+holeS*2,frameT]);
      translate([holeS,holeS,-1]) cube([boardT,shelfW,frameT+2]);
  }
}

module shelfHole() {
  translate([-holeS/2,(frameW-shelfW-4)/2,-1]) cube([boardT+holeS,shelfW+holeS,frameT+2]);
}

module frame() {
  difference() {
    translate([-holeS,-holeS,0]) cube([frameH+holeS*2,frameW+holeS*2,frameT]);
    translate([0,0,-1]) cube([frameH,frameW,frameT+2]);
  } 
  difference() {
    cube([frameH,frameW,frameT]);
    hexGrid();
  }
}

module hexGrid() {
  for ( i = [0 : holeRowRowNum] ){ 
    even=i%2;
    translate([holeRowD*i,even*-holeD/2,0])
    hexRow(holeRowNum+even);  
  }
}

module hexRow(l) {
  for ( i = [0 : l] ){ 
    translate([0,holeD/2+holeD*i,0])
    hex();  
  }
}

module hex() {
  translate([0,0,-1]) cylinder(r=holeR,h=frameT+2,$fn=6);
}

module shelf() translate([boardT,(frameW-shelfW)/2,-4]) rotate([0,-90,0]) {
  board();
  translate([0,boardW+1,0]) board();
}

module board() {
  cube([boardL,boardW,boardT]);
}