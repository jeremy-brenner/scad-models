t=2;
$fn=128;

w=80;
hd=71.5;
o=(80-71.5)/2;

hoseR=15.25;
fanR=39;
hoseDist=16.25;

translate([0,0,3]) difference() {
  airChaimber(fanR+t,hoseR+t,hoseDist,30);
  translate([0,0,-0.1]) airChaimber(fanR,hoseR,hoseDist,30.2);
}

translate([0,0,3+31]) {
  difference() {
    hull() {
      translate([-hoseDist,0,0]) cylinder(r=hoseR+t,h=t);
      translate([hoseDist,0,0]) cylinder(r=hoseR+t,h=t);
    }
    translate([-hoseDist,0,-0.1]) cylinder(r=hoseR,h=t+0.2);
    translate([hoseDist,0,-0.1]) cylinder(r=hoseR,h=t+0.2);
  }
  translate([-hoseDist,0,0]) hoseHole(40);
  translate([hoseDist,0,0]) hoseHole(40);
}



fanMount();


module airChaimber(bigR,littleR,littleD,h) {
  hull() {
    translate([-littleD,0,h]) cylinder(r=littleR,h=1);
    translate([littleD,0,h]) cylinder(r=littleR,h=1);
    cylinder(r=bigR,h=1);
  }
}


module fanMount() {
  h=3;
  screwHoleR=2.1;
  difference() {
    m=hd/2;
    hull() {
      r=5.5;
      translate([m,m,0]) cylinder(r=r,h=h);
      translate([-m,m,0]) cylinder(r=r,h=h);
      translate([m,-m,0]) cylinder(r=r,h=h);
      translate([-m,-m,0]) cylinder(r=r,h=h);
    }
    translate([m,m,-0.1]) cylinder(r=screwHoleR,h=h+0.2);
    translate([-m,m,-0.1]) cylinder(r=screwHoleR,h=h+0.2);
    translate([m,-m,-0.1]) cylinder(r=screwHoleR,h=h+0.2);
    translate([-m,-m,-0.1]) cylinder(r=screwHoleR,h=h+0.2);
    translate([0,0,-0.1]) cylinder(r=w/2-1,h=h+0.2);
  }
}

module hoseHole(h) {
  difference() {
    cylinder(r=hoseR+t,h=h);
    translate([0,0,-0.1]) cylinder(r=hoseR,h=h+0.2);
  }
}