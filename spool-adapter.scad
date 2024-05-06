$fn=128;

cardboardSpool();

module cardboardSpool() {
    r=99.5;
    ww=0.42;
    t=ww*2;
    difference() {
      cylinder(r=r+t,h=5);
      translate([0,0,-0.1]) cylinder(r=r,h=6.2);
    }
  translate([0,0,0.5]) torus(r,0.5);
  translate([0,0,4.5]) torus(r,0.5);
}

module smallSpool() {
    difference() {
  cylinder(r=100,h=4.5);
  translate([0,0,-0.1]) cylinder(r=84,h=5);
}


intersection() {
  translate([0,0,-0.1]) hexGrid(10,1.7,2,11,11,[],[],"black");
  cylinder(r=84,h=1.5);
}
difference() {
  cylinder(r=10,h=1.5);
  translate([0,0,-0.1]) cylinder(r=2.25,h=1.7);
}

}

module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn);
}



module hexGrid(hexInradius,height,supportThickness,xLen,yLen,skipCells,cappedCells,color) {

  center=true;

  xu = hexCircumradius(hexInradius-supportThickness/2)*1.5;
  yu = hexInradius*2-supportThickness;
  eu = hexInradius-supportThickness/2;
 
  xdist = center ? -xu*xLen/2+xu/2 : 0;
  ydist = center ? -yu*yLen/2 : 0;

  translate([xdist,ydist,0]) {
    for ( ix = [0 : xLen-1] ){ 
      even=ix%2;
      x = xu*ix; 
      for ( iy = [0 : yLen-even] ){ 
        y = yu*iy+eu*even;

        shouldSkip = search([[ix,iy]], skipCells)[0] != [];
        shouldCap = search([[ix,iy]], cappedCells)[0] != [];
        
        //color("black", shouldSkip ? 0.1 : 1) label(x,y,ix,iy,hexInradius);

        if(!shouldSkip) {
          color(color, shouldSkip ? 0.1 : 1) translate([x,y,0]) hex(hexInradius,supportThickness,height,shouldCap);
        }
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

module label(x,y,ix,iy,hexInradius) {
  translate([x,y,0]) rotate([$vpr[0],$vpr[2],$vpr[1]]) text(text = str("[",ix,",",iy,"]"), size = hexInradius/3, halign = "center", valign = "center");
}

function hexCircumradius(hexInradius) = hexInradius/sqrt(3)*2;