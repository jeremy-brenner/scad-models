$fn=64;
//160

pipeR=80;
h=80;
t=1.6;

xMult=1/2;
yMult=sqrt(3)/2;
holeR=pipeR*0.60;

difference() {
  cylinder(r=pipeR+t,h=h+t);
  translate([0,0,t]) cylinder(r=pipeR,h=h+0.1);
  hole();
  translate([holeR,0,0]) hole();
  translate([holeR*xMult,holeR*yMult,0]) hole();
  translate([holeR*-xMult,holeR*yMult,0]) hole();
  translate([-holeR,0,0]) hole();
  translate([holeR*xMult,holeR*-yMult,0]) hole();
  translate([holeR*-xMult,holeR*-yMult,0]) hole();
}


module hole() {
  translate([0,0,-1]) cylinder(r=6,h=10,$fn=6);
}


