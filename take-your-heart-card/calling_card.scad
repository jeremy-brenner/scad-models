lh=0.12;

tagLayers=9;
tagH=tagLayers*lh;

// difference() {
//   cylinder(r=15,h=1+lh*4);
//   translate([0,0,lh*2]) cylinder(r=13,h=1);
//   // cube([100,100,100]);
// }



intersection() {
  difference() {
    card();
    color("green") translate([0,0,-1.5]) cylinder(r=13,h=tagH);
  }
//color("black") translate([-100,-100,-1.5]) cube([200,200,1.51+lh]);
//color("white") translate([-100,-100,0.1]) cube([200,200,0.68]);
//color("red") translate([-100,-100,0.68]) cube([200,200,10]);
}


module card() {
  scale([0.4665,0.4665,0.7]) import("Calling_Card.stl");
  xd=81.7;
  yd=60;
  translate([-xd/2,-yd/2,-1.5-lh*2]) cube([xd,yd,1]);
}