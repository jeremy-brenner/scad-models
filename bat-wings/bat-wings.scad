$fn=32;

sbr=1.5;
bbr=3.25;
tt=1.6;

difference() {
  hr=8;
  plate();
  armBarPath(sbr);
  mirror([0,1,0]) armBarPath(sbr);
  translate([0,10,0]) armBarPath(bbr);
  mirror([0,1,0]) translate([0,10,0])  armBarPath(bbr);
  translate([15,0,-5]) cylinder(r=hr,h=10,$fn=6);
  translate([30,9,-5]) cylinder(r=hr,h=10,$fn=6);
  translate([30,-9,-5]) cylinder(r=hr,h=10,$fn=6);

  translate([45,0,-5]) cylinder(r=hr,h=10,$fn=6);
  translate([45,18,-5]) cylinder(r=hr,h=10,$fn=6);
  translate([45,-18,-5]) cylinder(r=hr,h=10,$fn=6);

  translate([60,9,-5]) cylinder(r=hr,h=10,$fn=6);
  translate([60,-9,-5]) cylinder(r=hr,h=10,$fn=6);

  translate([75,0,-5]) cylinder(r=hr,h=10,$fn=6);
  translate([75,18,-5]) cylinder(r=hr,h=10,$fn=6);
  translate([75,-18,-5]) cylinder(r=hr,h=10,$fn=6);
}

module plate() {
  intersection() {
    translate([0,-100,-10]) cube([90,200,20]);
    hull() {
      translate([0,10,0]) armBarPath(bbr+tt);
      mirror([0,1,0]) translate([0,10,0])  armBarPath(bbr+tt);
    }
  }
}

module halfPlate() {
  intersection() {
    translate([0,-100,0]) cube([90,200,10]);
    hull() {
      translate([0,10,0]) armBarPath(bbr+1.2);
      mirror([0,1,0]) translate([0,10,0])  armBarPath(bbr+1.2);
    }
  }
}


module armBarPath(r) {
  hull() {
    translate([0,20,0]) sphere(r=r);
    translate([90,45,0]) sphere(r=r);
  }
}