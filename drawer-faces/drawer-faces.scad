drawerFace = [797, 203, 23];
tileSize = [345.49, 352.4];
borderWidth=5;
thickness=3;

targetTileSize=[
  (drawerFace[0]-borderWidth*2)/4,
  drawerFace[1]-borderWidth*2
];

xScale=targetTileSize[0]/tileSize[0];
yScale=targetTileSize[1]/tileSize[1];

renderDrawer=true;

renderPiece=-1; // [-1:All, 0:One, 1:Two, 2:Three, 3:Four]

color("white") {
  for ( i = [0 : 3] ){
    if(i==renderPiece || renderPiece==-1) {
      piece(i);
    }
  }
}

if(renderDrawer) {
  color("black") translate([0,0,-drawerFace[2]]) cube(drawerFace);
}

module piece(i) {
  linear_extrude(height = thickness) translate([borderWidth,borderWidth]) scale([xScale,yScale])  translate([tileSize[0]*i,0]) tile();
  translate([targetTileSize[0]*i+borderWidth,0]) difference() {
    cube([targetTileSize[0],targetTileSize[1]+borderWidth*2,thickness]);
    translate([-1,borderWidth,-1]) cube([targetTileSize[0]+2,targetTileSize[1],thickness+2]);
    translate([-1,1.5,-1]) cube([targetTileSize[0]+2,2,2.5]);
    translate([-1,targetTileSize[1]+6.5,-1]) cube([targetTileSize[0]+2,2,2.5]);
  }
  if(i==0) {
    cube([borderWidth,targetTileSize[1]+borderWidth*2,thickness]);
  }
  if(i==3) {
    translate([targetTileSize[0]*4+borderWidth,0,0]) cube([borderWidth,targetTileSize[1]+borderWidth*2,thickness]);
  }
}

module border(x,y,w) {
  difference() {
    square([x,y]);
    translate([w,w]) square([x-w*2,y-w*2]);
  }
}

module tiles() {
  for ( i = [0 : 3] ){
    translate([tileSize[0]*i,0]) tile();
  }
}

module tile() {
  intersection() {
    translate([-0.05,-0.2]) import("islamic-stars.svg");
    square([345.49,352.4]);
  }
}