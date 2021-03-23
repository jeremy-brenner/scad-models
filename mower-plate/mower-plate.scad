
outputSvg=true;

$fn=64;

if(outputSvg) {
  projection(cut = true) 
    mowerPlate();
} else {
  mowerPlate();
}

module mowerPlate() {
  plateLength = 228.5; 
  plateWidth = 108;
  plateThickness = 2.8;
  difference() {
    plate(l=plateLength,w=plateWidth,t=plateThickness);
    roundHoleFlatSide(r=7.9, c=0.7, x=22.5, y=86.25); // 1
    roundHole(r=5, x=48.5, y=88.25); // 2
    rectangleHole(l=56.8, w=28.6, x=65.7, y=71.25); // 3
    roundHole(r=14.2, x=148.5, y=76.25); // 4
    roundHole(r=26.2, x=195.5, y=71.25); // 5

    rectangleHole(l=24.4, w=37, x=12.1, y=10.25); // 7
    rectangleHole(l=36.8, w=20.8, x=51.7, y=16.25); // 8
    roundHole(r=6, x=114.5, y=26.25); // 9
    roundHole(r=6, x=148.5, y=26.25); // 10
    roundHole(r=9.5, x=179.5, y=23.25); // 11
    roundHole(r=3.5, x=10, y=plateWidth/2); // 12

    weirdThing(x=25,y=51.25,a=-8); // 6, 13, 14
  }
}

module plate(l,w,t) {
  cr = 10; //corner radius

  translate([0,cr,0]) cube([l,w-cr*2,t]);
  translate([cr,0,0]) cube([l-cr*2,w,t]);
  translate([cr,cr,0]) cylinder(r=cr,h=t);
  translate([cr,w-cr,0]) cylinder(r=cr,h=t);
  translate([l-cr,w-cr,0]) cylinder(r=cr,h=t);
  translate([l-cr,cr,0]) cylinder(r=cr,h=t);
  translate([l,w/2,0]) tab(t);
}

module tab(t) {
  tw = 36; //tab width
  td = 7;  //tab depth
  tcr = 2; //tab corner radius;
  twr = 2; //tab wing radius;
  translate([0,-tw/2,0]) {
    cube([td-tcr,tw,t]);
    translate([td-tcr,tcr,0]) cylinder(r=tcr,h=t);
    translate([td-tcr,tw-tcr,0]) cylinder(r=tcr,h=t);
    translate([0,tcr,0]) cube([td,tw-tcr*2,t]);
    translate([0,-twr,0]) difference() {
      cube([twr,tw+twr*2,t]);
      translate([twr,0,-1]) cylinder(r=twr,h=t+2);
      translate([twr,tw+twr*2,-1]) cylinder(r=twr,h=t+2);
    }
  }
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