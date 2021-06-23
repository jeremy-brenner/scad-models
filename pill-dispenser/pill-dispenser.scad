$fn=32;


use <../modules/hex-grid.scad>

lw=0.4;
t=lw*2;
//rotate([0,0,0]) translate([50,0,0]) pill(pr,ph);
//rotate([0,0,10]) translate([50,0,0]) pill(pr,ph);

// pillHole(pr+0.5,ph,1);

//carousel();
//carouselCap();

//bearingPost();
bearingHole();
//pillBox();
//motorMount();

pr=3.5;
ph=21;

hexR=4.5;

bearingOuterR=11;
//pd=10;

      //  pill(pr,ph);
        //pillHole(pr+0.5,ph,1);
c=35;
a=10;
d=52;

//ring(35,10,52) pill(pr,ph);


module ring(c,a,d) {
  for ( i = [0 : c] ) rotate([0,0,i*a]) translate([d,0,0]) children();
}

module carouselCap() {
  difference() {
    ring(35,10,52) cylinder(r=pr+0.6+t*2,h=8);
    translate([0,0,t]) ring(35,10,52) cylinder(r=pr+0.6+t,h=ph+2);
    translate([0,0,t]) cylinder(r=52,h=8);

  }
}


module carousel() {
  difference() {
    union() {
      ring(35,10,52) cylinder(r=pr+0.5+t,h=ph);

      intersection() {
        hexGrid(hexR,4,t,15,13,[],[]);
        cylinder(r=52,h=10);
      }
    }
    translate([0,0,-1]) ring(35,10,52) cylinder(r=pr+0.5,h=ph+2);
  }
}


module bearingPost() {
  cylinder(r=4,h=8);
  translate([0,0,8]) cylinder(r=5,h=5);
}

module bearingHole() {
  difference() {
    translate([-bearingOuterR-5,-bearingOuterR-5,0]) cube([bearingOuterR*2+10,bearingOuterR*2+10,8]);
    translate([0,0,-1]) cylinder(r=bearingOuterR+0.75,h=10);
  }
  ring(7,45,bearingOuterR+0.75) cylinder(r=1,h=8);
}

module hexPost() {
  cylinder(r=hexCircumradius(hexR-t-0.2),h=5,$fn=6);
  translate([0,0,5]) cylinder(r=hexR,h=5);
}

module pillHole(r,h,t) {
  difference() {
    cylinder(r=r+t,h=h);
    translate([0,0,-1]) cylinder(r=r,h=h+2);
  }
}

module pill(r,h) {
  translate([0,0,r]) {
    sphere(r=r);
    cylinder(r=r,h=h-r*2);
    translate([0,0,h-r*2]) sphere(r=r);
  }
}

module pillBox() {
  t=2;
  w=140;
  h=45;
  translate([-w/2,-w/2,0]) {
    difference() {
      cube([w+t*2,w+t*2,h+t]);
      translate([t,t,t]) cube([w,w,h+t]);
    }
  }
}

module motorMount() {
  difference() {
    translate([-25,-15,0]) cube([50,30,2]);
    translate([35/2,0,-0.5]) cylinder(r=3,h=5);
    translate([-35/2,0,-0.5]) cylinder(r=3,h=5);
    translate([0,8,-0.5]) cylinder(r=5,h=5);
  }
  translate([35/2,0,0]) screwHole();
  translate([-35/2,0,0]) screwHole();
}

module screwHole() {
  difference() {
    cylinder(r=4,h=4);
    translate([0,0,-0.5]) cylinder(r=2,h=5);
  }
}