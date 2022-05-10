
bumpScale=0.85;
bumpHeight=0.5;
brickHeight=6;
mw=8;
ew=5.5;
lengthHack=0.5;

bew=sqrt((ew*ew)/2);


brick();


module brick() {
  brickEndBumped();
  translate([0,mw/2+ew/2,0]) brickMiddleBumped();
  translate([0,ew+mw+lengthHack,0]) brickEndBumped();
}

module brickMiddleBumped() {
  hull() {
    brickMiddle(brickHeight);
    scale([bumpScale,1+1-bumpScale,1]) translate([0,0,brickHeight]) brickMiddle(bumpHeight);
  }
}

module brickEndBumped() {
  hull() {
    brickEnd(brickHeight);
    scale([bumpScale,bumpScale,1]) translate([0,0,brickHeight]) brickEnd(bumpHeight);
  }
}



module brickMiddle(h) {
  translate([-mw/2,-mw/2,0]) cube([mw,mw+lengthHack,h]);
}

module brickEnd(h) {
  translate([-mw/2,-ew/2,0]) cube([mw,ew,h]);
  translate([mw/2,-ew/2,0]) rotate([0,0,45]) cube([bew,bew,h]);
  translate([-mw/2,-ew/2,0]) rotate([0,0,45]) cube([bew,bew,h]);
}



