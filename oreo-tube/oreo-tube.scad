$fn=64;


tube();
// translate([0,0,122]) mirror([0,0,1]) cap();


module cutout() {
  difference() {
    intersection() {
      translate([0,0,-0.1]) cylinder(r=23.5,h=2.2);
      translate([0,0,-0.2]) cylinder(r=18,h=2.4);
    }
    translate([-3,-20,-0.2]) cube([6,40,2.4]);
  }
}


module cap() {
  difference() {
    cylinder(r=23.5,h=2);
    cutout();
  }
 
  intersection() {
    difference() {
      cylinder(r=23.5,h=6);
      translate([0,0,-0.1]) cylinder(r=23.5-1.2,h=6.2);
    }
    union() {
      translate([-50,-5,-0.1]) cube([100,10,6.2]);
      rotate([0,0,360/3]) translate([-50,-5,-0.1]) cube([100,10,6.2]);
      rotate([0,0,360/6]) translate([-50,-5,-0.1]) cube([100,10,6.2]);  
    }
  }

  blep();
  rotate([0,0,60]) blep();
  rotate([0,0,60*2]) blep();
  rotate([0,0,60*3]) blep();
  rotate([0,0,60*4]) blep();
  rotate([0,0,60*5]) blep();


}

module blep() {
  for ( i = [-9:8]) {
    hull() {
      rotate([0,0,i]) translate([23.5,0,5]) sphere(r=1,$fn=16);
      rotate([0,0,i+1]) translate([23.5,0,5]) sphere(r=1,$fn=16);
    }
  }
}

module tube() {
  difference() {
    cylinder(r=26,h=122);
    cutout();
    translate([0,0,2]) cylinder(r=24,h=120.1);
    translate([-50,-5,116]) cube([100,10,2]);
    rotate([0,0,360/3]) translate([-50,-5,116]) cube([100,10,2]);
    rotate([0,0,360/6]) translate([-50,-5,116]) cube([100,10,2]);
  }
}