$fn=64;


boardVersion=2; //[1,2]

t=1.5;
caseH=8.5;

showBoard=false;
showFront=true;
showBack=true;
showSwivel=true;
showMount=true;

boardWx=25;
boardWy=24;

bufferSize=0.5;

holeDe=2;

holeDy=12.5;

holeDx=boardWx-holeDe*2;

frontWx=boardWx+bufferSize*2;
frontWy=boardWy+bufferSize*2;

cameraDy= (boardVersion==2) ? 14.5 : 13.75;
cr=3.8;
caseRadius=2.5;

pegRadius= (boardVersion==2) ? 1.0 : 0.9;
//(boardVersion==2) ? 12.5 : 13.5;

if(showBoard) {
  translate([holeDe+bufferSize,holeDe+bufferSize,4.75]) board();
}
if(showFront) {
  front();
}
if(showBack){
  translate([0,0,caseH+0.1]) back();
}
if(showSwivel) {
  swivel();
}
if(showMount) {
  mount();
}

module mount() {
    w=20;
    translate([91,36.7,4]) rotate([90,0,180]) {
    difference() {
      mountCylinder(12);
      translate([-(cr+0.1),2,-(cr+0.1)]) cube([(cr+0.1)*2,8,(cr+0.1)*2]);
    }
    translate([0,-2.5,0]) nutCylinder();  
    translate([-cr,-2.5,cr]) cube([cr*2,17,1.5]);
    }
  
    renderCells=[
      [0,0],[0,1],
      [1,0],[1,1],
      [2,1],[2,2],
      [3,1], [3,2],
      [4,2], [4,3],
       [5,2], [5,3],
      [6,3],
    ];

    difference() {
      hexGrid(7.5,1.5,w,renderCells);
      translate([-11,-8,-0.1]) cube([20,20,w+0.2]);  
    }

    translate([-11,12,0]) rotate([0,0,-90]) barMount(w,1.5);
}

module barMount(length,wall_width) {
  difference() {
    translate([-wall_width,0,0])  cube([20+wall_width*2,20+wall_width,length]);
    translate([0,-0.1,-0.1]) cube([20,20.1,length+0.2]);
  }

  translate([7.25,18,0]) cube([5.5,2,length]);

  translate([0,7.25,0]) {
    beveledStrip(length);
    translate([20,0,0]) mirror([1,0,0]) beveledStrip(length);
  }
}

module beveledStrip(length) {
  difference() {
    cube([2,5.5,length]);
    rotate([0,0,-45]) translate([0,0,-1]) cube([2,5.5,length+2]);
  }
}

module swivel() {
  translate([0,-cr,0]) mountCylinder(cr*2);
  translate([0,0,cr*2]) rotate([0,180,90]) translate([0,-cr,0]) mountCylinder(cr*2);
}

module board() {
  difference() {
    linear_extrude(height=1) caseShape(2);
    translate([0,0,-0.1]) holePositions() cylinder(r=pegRadius,h=1.2);
  }

  translate([0.5,16.5,1]) color("white") cube([20,4,2.5]);
  
  color("grey") translate([-0.5,20.5,1]) cube([22,1.5,2.5]);
  translate([holeDx/2,cameraDy-2,-3]) {
    color("grey") translate([0,0,-2]) cylinder(r=3.8,h=2);
    color("black") translate([0,0,-2.1]) cylinder(r=3.4,h=0.1);
    color("grey") translate([-4.25,-4.25,0]) cube([8.5,8.5,3]);
  }

}

module holePositions() {
    children();
    translate([holeDx,0,0]) children();
    translate([holeDx,holeDy,0]) children();
    translate([0,holeDy,0]) children();
}

module front() {
  difference() {
    translate([holeDe+bufferSize,holeDe+bufferSize,0]) linear_extrude(height=caseH) caseShape(caseRadius+t);
    translate([holeDe+bufferSize,holeDe+bufferSize,0]) translate([0,0,t]) linear_extrude(height=caseH) caseShape(caseRadius);

    translate([4.25,frontWy-1.5,6]) cube([17.5,5,8]);

    translate([frontWx/2,cameraDy+bufferSize,-0.1]) cylinder(r=4,h=1.7);
  }
  
  translate([2.5,2.5,t]) holePositions() peg(pegRadius);
}

module back() {
  translate([holeDe+bufferSize,holeDe+bufferSize,0]) linear_extrude(height=t) caseShape(caseRadius+t);
  translate([4.5,frontWy,t]) cube([17,t,2]);
  translate([2.5,2.5,t]) holePositions() difference() {
    cylinder(r=2,h=2.75);
    translate([0,0,-0.1]) cylinder(r=pegRadius+0.1,h=3);
  }

  translate([frontWx/2,frontWy-13,-cr]) difference() {
    mountCylinder(12);
    translate([-(cr+0.1),2,-(cr+0.1)]) cube([(cr+0.1)*2,8,(cr+0.1)*2]);
  }
  translate([frontWx/2,frontWy-1,-cr]) nutCylinder();

}

module mountCylinder(h) {
   rotate([-90,0,0]) difference() {
    union() {
      cylinder(r=cr,h=h);
      translate([-cr,-cr,0]) cube([cr*2,cr,h]);
    }
    translate([0,0,-0.1]) cylinder(r=1.6,h=h+0.2);
  }
}

module nutCylinder() {
  rotate([-90,0,0]) difference() {
    cylinder(r=cr,h=2.5);
    translate([0,0,-0.1]) cylinder(r=3.3,h=2.7,$fn=6);
  }
}

module caseShape(wr=2.5) {
  if(boardVersion==2) {
    hull() {
      circle(r=wr);
      translate([holeDx,0,0]) circle(r=wr);
      translate([holeDx,boardWy-holeDe*2,0]) circle(r=wr);
      translate([0,boardWy-holeDe*2,0]) circle(r=wr);
    }
  } else {
    translate([-wr,-wr,0]) square([holeDx+wr*2, boardWy-holeDe*2+wr*2]);
  }
}


module peg(pr) color("green") {
  standoffHeight=3;
  translate([0,0,standoffHeight]) cylinder(r=pr,h=3);
  cylinder(r=2,h=standoffHeight);
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