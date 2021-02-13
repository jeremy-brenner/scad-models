

Piece="Tray"; // [Tray, Short, Long]


main(Piece);

module main(p) {
  l=124;
  w=212;

  h=10;
  t=1.8;
  
  if(Piece=="Tray") {
    tray(l,w,h,t);
  }
  if(Piece=="Short") {
    shortSide(l,w,h,t,h/2+0.25);
  }
  if(Piece=="Long") {
    longSide(l,w,h,t,h/2+0.25);
  }
  
}

module tray(l,w,h,t) {
  translate([0,0,-1.5]) cube([l,w,1.5]);
  translate([l/2,w/2,0]) cylinder(r=2.5,h=h, $fn=64);
  shortSide(l,w,h,t,h+0.2);
  longSide(l,w,h,t,h+0.2);
  translate([0,w-t,0]) shortSide(l,w,h,t,h+0.2);
  translate([l-t,0,0]) longSide(l,w,h,t,h+0.2);
}

module shortSide(l,w,h,t,hh) {
  difference() {
    cube([l,t,h]);
    translate([l/3-t/2,-0.5,-0.1]) cube([t+0.2,t+2,hh]);
    translate([l/3*2-t/2,-0.5,-0.1]) cube([t+0.2,t+2,hh]);
 
  }
}

module longSide(l,w,h,t,hh) {
  difference() {
    cube([t,w,h]);
    translate([-0.5,w/5-t/2,-0.1]) cube([t+2,t+0.2,hh]);
    translate([-0.5,w/5*2-t/2,-0.1]) cube([t+2,t+0.2,hh]);
    translate([-0.5,w/5*3-t/2,-0.1]) cube([t+2,t+0.2,hh]);
    translate([-0.5,w/5*4-t/2,-0.1]) cube([t+2,t+0.2,hh]);
   // translate([-0.5,w/6*5-t/2,-0.1]) cube([t+2,t+0.2,hh]);
  } 
}