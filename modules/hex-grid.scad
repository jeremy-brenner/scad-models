
module hexGrid(hexInradius,height,supportThickness,xLen,yLen,skipCells,cappedCells) {

  for ( ix = [0 : xLen-1] ){ 
    even=ix%2;
    x = (hexCircumradius(hexInradius-supportThickness/2)+hexCircumradius(hexInradius-supportThickness/2)/2 )*ix; 
    for ( iy = [0 : yLen-1] ){ 
      y = (hexInradius*2-supportThickness)*iy+even*(hexInradius-supportThickness/2);

      shouldSkip = search([[ix,iy]], skipCells)[0] >= 0;
      shouldCap = search([[ix,iy]], cappedCells)[0] >= 0;

      if(!shouldSkip) {
        translate([x,y,0]) hex(hexInradius,supportThickness,height,shouldCap);
      }
    }
  }
}

module hex(hexInradius,supportThickness,height,shouldCap) {
  zMove = shouldCap ? 1.6 : -1;
  difference() {
    cylinder(r=hexCircumradius(hexInradius),h=height,$fn=6);
    translate([0,0,zMove]) cylinder(r=hexCircumradius(hexInradius-supportThickness),h=height+2,$fn=6);
  }
}

function hexCircumradius(hexInradius) = hexInradius/sqrt(3)*2;