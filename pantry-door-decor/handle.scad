boneR=1.5;
// fullDist=242;
fullDist=80;

//48"W x 80"H Primed
inches=25.4;
doorW=24*inches;
doorH=80*inches;
knobH=38*inches;
// 1" = 25.4mm

$fn=32;


door();
mirror([0,1,0]) door();

// handle();

// halfStar();
  
module door() {
  translate([0,3,0]) {
    color("white") translate([0,0,-10]) cube([doorH,doorW,10]);
    translate([knobH,0,0]) {
      halfStar();
      handle();
      rotate([0,0,22.5]) translate([100,0,0]) dowel(12*inches);
      rotate([0,0,2]) translate([100,0,0]) dowel(24*inches);
      rotate([0,0,178]) translate([100,0,0]) dowel(24*inches);

      rotate([0,0,45]) translate([100,0,0]) dowel(24*inches);
      rotate([0,0,135]) translate([100,0,0]) dowel(24*inches);
      rotate([0,0,90]) translate([100,0,0]) dowel(12*inches);
      rotate([0,0,67.5]) translate([100,0,0]) dowel(12*inches);
      rotate([0,0,112.5]) translate([100,0,0]) dowel(12*inches);
      rotate([0,0,157.5]) translate([100,0,0]) dowel(12*inches);
    }
  }
}

module halfStar() {
  intersection() {
    translate([0,1,0]) star();
    translate([-500,0,-500]) cube([1000,1000,1000]);
  }
}

module handle() {
  color("black") translate([7,12,10]) scale([2,1,1]) cylinder(r=7,h=5);
  // difference() {
  //       cylinder(r=50,h=5);
  //       translate([0,0,-0.1]) cylinder(r=35,h=5.2);
  //       translate([-50,-95,-1]) cube([100,100,100]);
  // }
}

module dowel(l) {
  cube([l,0.25*inches,0.25*inches]);
}

module star() {
  for (i = [0:2:9]) {
    point(i);
  }
}

module point(i) {
  iNext=nextPoint(i);
  iPrev=prevPoint(i);
  // a=360/16;
  a=360/10;
  hull() {
    rotate([0,0,iNext*a]) translate([fullDist*pointDist(iNext) ,0,0]) sphere(r=boneR);
    rotate([0,0,iNext*a]) translate([fullDist*pointDist(iNext)*0.97 ,0,3]) sphere(r=boneR);

    rotate([0,0,i*a]) translate([fullDist*pointDist(i) ,0,0]) sphere(r=boneR);
    rotate([0,0,i*a]) translate([fullDist*pointDist(i)*0.97 ,0,3]) sphere(r=boneR);

    rotate([0,0,iPrev*a]) translate([fullDist*pointDist(iPrev) ,0,0]) sphere(r=boneR);
    rotate([0,0,iPrev*a]) translate([fullDist*pointDist(iPrev)*0.97 ,0,3]) sphere(r=boneR);

    sphere(r=boneR);
    translate([0,0,3]) sphere(r=boneR);
  }
}

function nextPoint(i) = (i+1)%16;
function prevPoint(i) = (i+15)%16;

// function pointDist(i) = (i%2==1)?0.4:(i%4==0)?1:0.7;
function pointDist(i) = (i%2==1)?0.45:1;