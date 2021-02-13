
$fn=32;

projection(cut = true) mowerPlate();

module mowerPlate() {
  plateThickness = 2.5;
  plateLength = 228.5;
  plateWidth = 105.5;
  plateCornerRadius = 10;
  tabWidth = 36;
  tabDepth = 10;

  difference() {
    plate(t=plateThickness,l=plateLength,w=plateWidth,cr=plateCornerRadius,tw=tabWidth,td=tabDepth);
    roundHoleFlatSide(r=7.9, c=0.7, x=206, y=85); // 1
    roundHole(r=5, x=180, y=87); // 2
    rectangleHole(l=56.8, w=28.6, x=102, y=70); // 3
    roundHole(r=14.2, x=80, y=73); // 4
    roundHole(r=26.1, x=33, y=70); // 5

    rectangleHole(l=24.4, w=37, x=194, y=9); // 3
    rectangleHole(l=36.8, w=20.8, x=140, y=15); // 3
    roundHole(r=6, x=80, y=25); // 9
    roundHole(r=6, x=120, y=25); // 10
    roundHole(r=9.5, x=50, y=20); // 11
    roundHole(r=3.5, x=plateLength-10, y=plateWidth/2); // 12

     weirdThing(x=105,y=35,a=8); // 6, 13, 14
  }
}

module plate(t,l,w,cr,tw,td) {
  translate([0,cr,0]) cube([l,w-cr*2,t]);
  translate([cr,0,0]) cube([l-cr*2,w,t]);
  translate([cr,cr,0]) cylinder(r=cr,h=t);
  translate([cr,w-cr,0]) cylinder(r=cr,h=t);
  translate([l-cr,w-cr,0]) cylinder(r=cr,h=t);
  translate([l-cr,cr,0]) cylinder(r=cr,h=t);
  translate([-td,w/2-tw/2,0]) cube([td,tw,t]);
}

module weirdThing(x,y,a) {
  translate([x,y,0]) rotate([0,0,a]) union() {
    lw = 13;
    sw = 4;
    roundHole(r=lw/2, x=lw/2, y=5.2+lw/2+6);  // 6
    roundHole(r=lw/2, x=39-lw/2, y=5.2+lw/2+6); // 6
    rectangleHole(l=39-6.5*2, w=lw, x=lw/2, y=5.2+6); // 6
    rectangleHole(l=58.5, w=sw, x=39-0.3, y=5.2+6+lw/2-sw/2); // 6

    rectangleHole(l=5.2, w=5.2, x=19, y=0); // 14
    rectangleHole(l=5.2, w=5.2, x=46+19, y=0); // 13
  }
}

module roundHole(r,x,y) {
  translate([x,y,-50]) cylinder(r=r,h=100);
}

module roundHoleFlatSide(r,c,x,y) {
  translate([x,y,0]) difference() {
    roundHole(r,x=0,y=0);
    translate([-r*3+c,-r,-50]) cube([r*2,r*2,100]);
  }
}

module rectangleHole(l,w,x,y) {
  translate([x,y,-50]) cube([l,w,100]);
}