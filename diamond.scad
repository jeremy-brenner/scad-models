
bigR=30;
smallR=bigR*0.7;

bottomH=bigR*1.4;
topH=bigR*0.5;

blunt=1;

tipR=0.75;

nozzleWidth=0.4;

diff=nozzleWidth*2;

hollowDiamond(bigR,smallR,tipR,bottomH,topH,diff);

// difference() {
//   hollowDiamond(bigR,smallR,tipR,bottomH,topH,diff);
//   translate([0,0,-500]) cube([1000,1000,1000]);
// }


module hollowDiamond(bigR,smallR,tipR,bottomH,topH,diff) {
  difference() {
    diamond(bigR,smallR,tipR,bottomH,topH);
    translate([0,0,diff]) diamond(bigR-diff,smallR-diff/2,tipR-diff/4,bottomH-diff,topH-diff);
  }
}



module diamond(bigR,smallR,tipR,bottomH,topH) {
  $fn=8;
  cylinder(r1=tipR,r2=bigR,h=bottomH+0.001);
  translate([0,0,bottomH]) cylinder(r1=bigR,r2=smallR,h=topH);
}