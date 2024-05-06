$fn=64;

bitSize=30;
targetBitSize=60;
s=targetBitSize/bitSize;
t=4;
ar=95;

scale([s,1,1]) intersection() {
  arch();
  translate([-bitSize/2,0,-1]) cube([bitSize,100,200]);
}

translate([-bitSize/2+targetBitSize/2,0,0]) intersection() {
  arch();
  translate([bitSize/2,0,-1]) cube([200,100,200]);
}

translate([bitSize/2-targetBitSize/2,0,0]) intersection() {
  arch();
  translate([-200-bitSize/2,0,-1]) cube([200,100,200]);
}

translate([-bitSize/2+targetBitSize/2,0,0]) nub();
mirror([1,0,0]) translate([-bitSize/2+targetBitSize/2,0,0]) nub();

module nub() {
  difference() {
    hull() {
      difference() {
        cylinder(r=ar-2+0.1,h=t);
        translate([0,0,-0.1]) cylinder(r=ar-2,h=t+0.2);
        translate([-100,-200,-0.1]) cube([200,200,t+0.2]);
        rotate([0,0,20]) translate([-100,0,-0.1]) cube([200,200,t+0.2]);
      }
      rotate([0,0,3.5]) difference() {
        cylinder(r=ar-5+0.1,h=t);
        translate([0,0,-0.1]) cylinder(r=ar-5,h=t+0.2);
        translate([-100,-200,-0.1]) cube([200,200,t+0.2]);
        rotate([0,0,13]) translate([-100,0,-0.1]) cube([200,200,t+0.2]);
      }
    }
    translate([0,0,-0.1]) cylinder(r=85,h=t+0.2);
  }
}

module arch() {
  intersection() {
    translate([-ar,0,0]) cube([ar*2,ar,t]);
    difference() {
      cylinder(r=ar,h=t);
      translate([0,0,-1]) cylinder(r=ar-2,h=t+2);
    }
  }
}

