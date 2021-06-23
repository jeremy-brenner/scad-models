
module tileSvg(svgFile,offsetX,offsetY,tileX,tileY,xTiles,yTiles) {
  for ( xPos = [0 : xTiles-1] ){ 
    for ( yPos = [0 : yTiles-1] ){ 
      svgTile(svgFile,offsetX,offsetY,tileX,tileY,xPos,yPos);
    }
  }
}

module svgTile(svgFile,offsetX,offsetY,tileX,tileY,xPos,yPos) {
  translate([tileX*xPos,tileY*yPos]) {
    intersection() {
      translate([offsetX,offsetY]) import(svgFile);
      square([tileX,tileY]);
    }
  }
}
