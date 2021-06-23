use <../modules/filagree-tile.scad>;

l=179;
w=19;
h=4;

t=2;

r=w/2;

fl=l+t*2;
fw=w+t*2;
fh=h+t*2;
fr=r+t;

//intersection() {
  //mkcase();
  lid();
//  halfCube();
//}

module halfCube() {
  translate([-1,-1,-1]) cube([fl+2,fw+2,fh/2+1]);
}

module case() {
  intersection() {
    wholeCase();
    lidCutter(0.1);
  }
}

module lid() {
  difference() {
    wholeCase();
    lidCutter(0);
  }
}

module lidCutter(diff) {
  
  translate([34.25,fr,-1]) union(){
    intersection() {
      cylinder(r=10.5,h=fh+2);
      translate([-10.5,-w/2,0]) cube([21,w,fh+2]);
    }
    intersection() {
      translate([0,0,t+diff]) cylinder(r=12.25-diff,h=fh-t-diff*2);
      translate([-12.25,-w/2-t/2+diff,0]) cube([21,w+t-diff*2,fh+2]);
    }
    translate([0,-fw/2-1,0]) cube([fl+2,fw+2,fh+2]);
  }
}

module wholeCase() {
  translate([fr,0,0]) {
    outerWall();
    filagree();
  }
}

module filagree() {
  intersection() {
    linear_extrude(height=fh) translate([-r,-0.2]) scale([0.2,0.2]) filagreeTile(5,1);
    difference() {
      innerCut();
      fileHole();
    }
  }
}

module outerWall() {
  difference() {
    union() {
      translate([0,fr,0]) cylinder(r=fr,h=fh);
      cube([fl-fr*2,fw,fh]);
      translate([fl-fr*2,fr,0]) cylinder(r=fr,h=fh);
    }
    innerCut();
  }
}

module innerCut() {
  translate([0,t,-1]) {
    translate([0,r,0]) cylinder(r=r,h=fh+2);
    cube([l-r*2,w,fh+2]);
    translate([l-r*2,r,0]) cylinder(r=r,h=fh+2);
  }
}

module fileHole() {
  translate([-fr,0,t]) cube([fl,fw,h]);
}