
$fn=128;

numberColor="#666666";
litTileColor="#DDFFDD";
darkTileColor="#999999";

plateColor="#666666";

fontSize=12;
fontYScale=1.4;
tileSize=27;
tileMargin=3;
tileOffset=tileSize+tileMargin;
lit=[true,false,true,true,true,false,false,true,false];

plateSize=tileSize*3+tileMargin*4;
matrixSize=80.5;
matrixOffset=(plateSize-matrixSize)/2;

pt=0.8;
bt=4;
nt=0.4;

ledMatrixClearance=2.5;
matrixBackT=1+ledMatrixClearance;

bw=plateSize+50;
bh=plateSize+20+80;

echo(plateSize);
plate(pt);
backing(bt,nt);
tiles(0.6); // back
translate([0,0,0.6])tiles(0.2); //front
numbers(pt);

matrixBack();
box();
lid();

module lid() {
  translate([-4,-plateSize-4,1]) {
    intersection() {
      difference() {
        cube([plateSize+8,plateSize+20+8,20]);
        translate([4,4,-0.1]) cube([plateSize,plateSize+20,20.2]);
      }
      hull() {
        cube([plateSize+8,0.1,5]);
        translate([0,plateSize+20+4,0]) cube([plateSize+8,4,20]);
      }
    }
    translate([0,0,-1]) difference() {
      cube([plateSize+8,plateSize+20+8,1]);
      translate([5,5,-0.1]) cube([plateSize-2,plateSize+20-2,1.2]);
    }

  }

  translate([-27.2,-plateSize-42,-10]) difference() {
    cube([bw+4.4,bh+4.4,12]);
    translate([2.1,2.1,-0.1]) cube([bw+0.4,bh+0.4,10.1]);
    translate([23.2,38,9.9]) cube([plateSize+8,plateSize+20+8,2.2]);
  }

  translate([0,60.5,0]) boxTab();
  translate([plateSize-15,60.5,0]) boxTab();

  translate([0,-133,0]) mirror([0,1,0]) {
    boxTab();
    translate([plateSize-15,0,0]) boxTab();
  }

 translate([-4,-plateSize-4,-10]) difference() {
        cube([plateSize+8,plateSize+20+8,10]);
        translate([3.8,3.8,-0.1]) cube([plateSize+0.4,plateSize+20.4,10.2]);
      }

}

module boxTab() {
    translate([0.5,0,-8]) rotate([0,90,0]) intersection() {
      cylinder(r=2,h=14);
      translate([-2,-2,0]) cube([4,2,14]);
    }
}

module box() {
  translate([-25,-plateSize-40,-50])
  difference() 
  {
    cube([bw,bh,50]);
    translate([2,2,2]) cube([bw-4,bh-4,50]);
    translate([25,-10,40]) cube([15,500,4]);
    translate([25+plateSize-15,-10,40]) cube([15,500,4]);
    translate([30,30,-1]) keyHole();
    translate([bw-30,30,-1]) keyHole();
    translate([30,bh-30,-1]) keyHole();
    translate([bw-30,bh-30,-1]) keyHole();
    translate([bw/2,bh/2,-1]) cylinder(r=5.5,h=10);
  }
}

module keyHole() {
  cylinder(r=5,h=10);
  translate([0,6.5,0]) cylinder(r=2.5,h=10);
  translate([-2.5,1,0]) cube([5,5,10]);
}
// bezel thing
// translate([0,0,-bt-matrixBackT]) cube([30,30,pt+bt+matrixBackT]);

module matrixBack() {
  translate([0,0,-4]) mirror([0,0,1]) difference() {
    union() {
      cube([plateSize,20,matrixBackT]);
      translate([0,-plateSize,0]) cube([plateSize,plateSize,matrixBackT]);
    }
    translate([matrixOffset,-matrixSize-matrixOffset,-0.1]) cube([matrixSize,matrixSize,ledMatrixClearance+0.1]);
    translate([15,-70,0]) cube([63,20,5]);
  }
}

module greenBlackTopLightThings() {
translate([tileMargin,tileMargin,pt]) {
  color(plateColor) cube([plateSize-tileMargin*2,20-tileMargin*2,0.4]);
  color("black") translate([0,0,0.4]) cube([plateSize/2-tileMargin*2,20-tileMargin*2,0.4]);
   color("green") translate([plateSize/2,0,0.4]) cube([plateSize/2-tileMargin*2,20-tileMargin*2,0.4]);
}
}

// translate([matrixOffset,-matrixSize-matrixOffset,-5]) ledMatrix();

module ledMatrix() {
  color("white") translate([2.5,2.5,0]) 
  for( y = [0:7]) {
    for( x = [0:7]) {
      translate([x*10,y*10,0.5]) cube([5,5,1.5]);
    }
  }
  color("black") cube([matrixSize,matrixSize,0.5]);
}

module backing(bt,nt) {
  translate([0,0,-bt]) color("black") {
    plate(bt);
    translate([0,0,bt-nt]) numbers(nt);
  } 
}

module plate(t) {
  color(plateColor) {
    difference() {
      translate([0,-plateSize,0]) cube([plateSize,plateSize,t]);
      translate([tileSize/2+tileMargin,-(tileSize/2+tileMargin),-0.1]) for ( num = [0 : 8] ) {
        row=floor(num/3);
        col=num%3;
        translate([tileOffset*col,-tileOffset*row,0]) {
          tile(false,t+0.2,lit[num]);
        }
      }
    }
    cube([plateSize,20,t]);
  }
}

module tiles(t) {
  translate([tileSize/2+tileMargin,-(tileSize/2+tileMargin),0]) for ( num = [0 : 8] ) {
    row=floor(num/3);
    col=num%3;
    translate([tileOffset*col,-tileOffset*row,0]) {
      tile(num+1,t,lit[num]);
    }
  }
}

module numbers(t) {
  translate([tileSize/2+tileMargin,-(tileSize/2+tileMargin),0]) for ( num = [0 : 8] ) {
    row=floor(num/3);
    col=num%3;
    translate([tileOffset*col,-tileOffset*row,0]) {
      number(num+1,t);
    }
  }
}

module tile(n,t,lit) {
  tileColor = lit ? litTileColor : darkTileColor;
  difference() {
    color(tileColor) translate([-tileSize/2,-tileSize/2,0]) cube([tileSize,tileSize,t]);
    if(n) {
      translate([0,0,-0.1]) number(n,t+0.2);
    }
  }
}

module number(n,t) {
  color(numberColor) linear_extrude(height=t) scale([1,fontYScale]) text(str(n), font="Poppins:style=SemiBold", size=fontSize, halign="center", valign="center");
}