br=3.25;
bd=11.5;
t=4;
//382
//25
$fn=64;


d=382/24;

// top();
// endOne();
// endTwo();
normal();


module top() {
  l=d*11 ;
  translate([0,-13,0]) rotate([0,0,45]) clip(l,l-16,8);
  translate([0,-13,0]) cube([1.2,12,l]);
  translate([0,-1.2,0]) cube([13,1.2,l]);
  difference() {
    hull() {
      cube([4,10,6]);
      translate([0,-1,0]) cube([4,1,18]);
    }
    rotate([0,0,25]) translate([0,5,3]) rotate([0,90,0]) cylinder(r=1,h=20);
  }
  translate([0,0,l]) mirror([0,0,1]) difference() {
    hull() {
      cube([4,10,6]);
      translate([0,-1,0]) cube([4,1,18]);
    }
    rotate([0,0,25]) translate([0,5,3]) rotate([0,90,0]) cylinder(r=1,h=20);
  }
}


module normal() {
  bit(12);
  translate([6,-17,0]) rotate([0,0,45]) clip(d,d,0);
  translate([6,-17,0]) cube([1.2,12,d]);
  translate([6,-5.2,0]) cube([13,1.2,d]);
}

module endOne() {
  bit(12);
  translate([6,-17,0]) rotate([0,0,45]) clip(d,8,0);
  translate([6,-17,0]) cube([1.2,12,d]);
  translate([6,-5.2,0]) cube([13,1.2,d]);
}

module endTwo() {
  bit(12);
  translate([6,-17,0]) rotate([0,0,45]) clip(d,8,d-8);
  translate([6,-17,0]) cube([1.2,12,d]);
  translate([6,-5.2,0]) cube([13,1.2,d]);
}


module clip(w,w2,z) {
  mirror([0,1,0]) {  
    translate([2.8,0,z]) {
      cube([0.8,3.4,w2]);
      translate([0,2.8,0]) cube([3,0.8,w2]);
      translate([12.9,0,0]) mirror([1,0,0]) {
        cube([0.8,3.4,w2]);
        translate([0,2.8,0]) cube([3,0.8,w2]);
      }
    }
    translate([0,0,z]) cube([17.2,1.2,w2]);
    cube([1.2,4.7,w]);
    translate([17.2,0,0]) cube([1.2,4.7,w]);
    translate([1.2,3.2,0]) scale([1,2,1]) cylinder(r=0.75,h=w);
    translate([17.2,3.2,0]) scale([1,2,1]) cylinder(r=0.75,h=w);
  }
}

module bit(w) {
  difference() {
    hull() {
      cylinder(r=5,h=w);
      translate([bd+br*2,0,0]) cylinder(r=5,h=w);
    }
    translate([0,0,-0.1]) {
      cut(w);
      translate([bd+br*2,0,0]) cut(w);
    }
  }
}
module cut(w) {
  rotate([0,0,45]) {
    cylinder(r=br,h=w+0.2);
    translate([0,-br,0]) cube([br*4,br*2,w+0.2]);
  }
}