
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
    roundHoleFlatSide(r=7.9, c=0.7, x=22.5, y=85); // 1
    roundHole(r=5, x=48.5, y=87); // 2
    rectangleHole(l=56.8, w=28.6, x=69.7, y=70); // 3
    roundHole(r=14.2, x=148.5, y=73); // 4
    roundHole(r=26.1, x=195.5, y=70); // 5

    rectangleHole(l=24.4, w=37, x=10.1, y=9); // 3
    rectangleHole(l=36.8, w=20.8, x=51.7, y=15); // 3
    roundHole(r=6, x=148.5, y=25); // 9
    roundHole(r=6, x=108.5, y=25); // 10
    roundHole(r=9.5, x=178.5, y=20); // 11
    roundHole(r=3.5, x=10, y=plateWidth/2); // 12

    weirdThing(x=25,y=50,a=-8); // 6, 13, 14
  }
}

module plate(t,l,w,cr,tw,td) {
  translate([0,cr,0]) cube([l,w-cr*2,t]);
  translate([cr,0,0]) cube([l-cr*2,w,t]);
  translate([cr,cr,0]) cylinder(r=cr,h=t);
  translate([cr,w-cr,0]) cylinder(r=cr,h=t);
  translate([l-cr,w-cr,0]) cylinder(r=cr,h=t);
  translate([l-cr,cr,0]) cylinder(r=cr,h=t);
  translate([l,w/2-tw/2,0]) cube([td,tw,t]);
}

module weirdThing(x,y,a) {
  translate([x,y,0]) rotate([0,0,a]) union() {

    narrowLength=58;
    narrowWidth=4;

    fatLength=39;
    fatWidth=13;

    smallHoleDist=46;
    smallHoleX=26.8;

    //narrow bit - 6
    rectangleHole(l=narrowLength+0.5, w=narrowWidth, x=0, y=5.2+6+fatWidth/2-narrowWidth/2); // 6

    //fat bit - 6 
    roundedRectangle(fatLength,fatWidth,narrowLength,5.2+6); //6
  
    //small holes 13 & 14
    rectangleHole(l=5.2, w=5.2, x=smallHoleX, y=0); // 13
    rectangleHole(l=5.2, w=5.2, x=smallHoleX+smallHoleDist, y=0); // 14
  }
}

module roundedRectangle(length,width,x,y) {
  translate([x,y,0]) {
    roundHole(r=width/2, x=width/2, y=width/2); 
    rectangleHole(l=length-width, w=width, x=width/2, y=0); 
    roundHole(r=width/2, x=length-width/2, y=width/2); 
  }
}

module roundHole(r,x,y) {
  translate([x,y,-50]) cylinder(r=r,h=100);
}

module roundHoleFlatSide(r,c,x,y) {
  translate([x,y,0]) difference() {
    roundHole(r,x=0,y=0);
    translate([r-c,-r,-50]) cube([r*2,r*2,100]);
  }
}

module rectangleHole(l,w,x,y) {
  translate([x,y,-50]) cube([l,w,100]);
}