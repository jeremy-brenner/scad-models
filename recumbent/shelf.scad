t=2;
postSmallR=9.25;
postBigR=11.125;
barDistance=145;

grid=[
  [-2,1], [-2,2], [-2,3], [-2,4], [-2,5], 
  [-1,0], [-1,1], [-1,2], [-1,3], [-1,4], [-1,5], 
  [0,0], [0,1], [0,2], [0,3], [0,4], [0,5], 
  [1,0], [1,1], [1,2], [1,3], [1,4], [1,5], 
  [2,0], [2,1], [2,2], [2,3], [2,4], [2,5], 
  [3,-1], [3,0], [3,1], [3,2], [3,3], [3,4], [3,5], 
  [4,0], [4,1], [4,2], [4,3], [4,4], [4,5], 
  [5,0], [5,1], [5,2], [5,3], [5,4], [5,5], 
  [6,0], [6,1], [6,2], [6,3], [6,4], [6,5], 
  [7,0], [7,1], [7,2], [7,3], [7,4], [7,5], 
  [8,1], [8,2], [8,3], [8,4], [8,5], 
];

hexesBarToBar=6;
hd=barDistance/(hexesBarToBar*sqrt(3));
hr=hd-t/2;

// lightMount();

rotate([0,270-40,0]) shelf();

// shelf();

//  posts();

module shelf() {
  rotate([0,-50,0]) translate([0,0,-125]) {
    rotate([0,0,-90]) mirror([1,0,0]) {
      hexGrid(hr,t,10,grid);
      positionedThing(hr+t,-t,-2,6) lightMount();
      positionedThing(hr+t,-t,8,6) lightMount();   
    }
    
    postHole();
    translate([0,barDistance,0]) postHole();

  }
}

module lightMount() {
  difference() {
    cylinder(r=hr+t*2,h=10,$fn=6);
    translate([0,0,-0.1]) cylinder(r=hr+t,h=10.2,$fn=6);
    rotate([180+40,0,0]) translate([-20,-18,2]) cube([40,100,10]);
  }
  intersection() {
    rotate([180+40,0,0]) translate([-20,-18,0]) difference() {
      cube([40,100,3]);
      translate([20-5.5,0,-1.1]) cube([11,100,2.9]);
    }
    cylinder(r=hr+t*2,h=10,$fn=6);
  }
}


module cutCube() {
  rotate([180+40,0,0]) translate([-20,-10,-7]) cube([40,100,10]);
}

module postHole() {
  rotate([0,0,90]) difference() {
    union() {
      cylinder(r=hd+t/2,h=10,$fn=6);
      translate([0,0,-10]) cylinder(r=postBigR+t+0.5,h=20);
    }
    translate([0,0,-11]) cylinder(r=postBigR+0.5,h=22);
  }
}

module posts() {
  color("orange") {
    post();
    translate([0,barDistance,0]) post();
  }
}

module post() {
  rotate([0,90+40,0]) {
    cylinder(r=postSmallR,h=105);
    translate([0,0,105]) cylinder(r=postBigR,h=35);
  }
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
  positionedThing(hr,d,ix,iy) cylinder(r=cr,h=h,$fn=6);
}

module positionedThing(hr,d,ix,iy) {
  even=abs(ix%2);
  translate([xPos(hr,d,ix),(hr+d/2)*even,0]) translate([0,(hr*2+d)*iy,0]) children();
}

function xPos(hr,d,ix) = (hr+d/2)*sqrt(3)*ix;

function circumradius(hr) = hr/(sqrt(3)/2);