wristR=75/2;
elbowR=90/2;
wristToElbow=240;
handR=95/2;
wristToHand=85;

difference() {
  union() {
    translate([-30,0,85]) rotate([0,-90,0]) boneBit(35,8,13);
    translate([-30,0,150]) rotate([0,-90,0]) boneBit(48,10,17);
    translate([-30,0,220]) rotate([0,-90,0]) boneBit(35,13,23);
    translate([-18,0,290]) rotate([0,-50,0]) boneBit(80,13,28);
  }
  scale([.75,1,1]) {
    t=3;
    translate([0,0,wristToHand]) cylinder(h=wristToElbow+10, r1=wristR+t, r2=elbowR+t);
    cylinder(h=wristToHand, r1=handR+t, r2=wristR+t);
  }
}


armPlate();


module boneBit(h,tr,br) {
  cylinder(h=h,r1=br,r2=tr);
  translate([0,0,h]) scale([1,1,0.7]) sphere(r=tr);
}

module armPlate(t=3) {
  difference() {
  intersection() {
    scale([.75,1,1]) {
      difference() {
        union() {
          translate([0,0,wristToHand]) cylinder(h=wristToElbow, r1=wristR+t, r2=elbowR+t);
          cylinder(h=wristToHand, r1=handR+t, r2=wristR+t);
        }
        union() {
          translate([0,0,wristToHand-0.1]) cylinder(h=wristToElbow+0.2, r1=wristR, r2=elbowR);
          translate([0,0,-0.1]) cylinder(h=wristToHand+0.2, r1=handR, r2=wristR);
        }
        translate([0,-5000,-1]) cube([10000,10000,10000]);
      }
    }

    hr=50;

    translate([1,0,hr]) rotate([0,-90,0]) {
      cylinder(r=hr,h=100);
      translate([0,-hr,0]) cube([300,hr*2,100]);
    }
  }

  rotate([0,50,0]) translate([-25.5,-50,-10]) cube([100,100,100]);
  translate([0,0,310]) rotate([0,-40,0]) translate([0,-50,0]) cube([100,100,100]);
  }

}