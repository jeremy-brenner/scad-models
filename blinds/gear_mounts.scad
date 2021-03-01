
module gearMount() {
  color("teal") translate([0,0,3]) cylinder(r=5.5,h=11);
  color("brown") translate([0,0,7]) cylinder(r=7.5,h=2);
  color("gold") cylinder(r=4,h=19);  
  translate([-1.5,-7.5,7.1]) cube([3,15,7]);
}

module blindGearMount() {
  difference() {
    gearMount();
    cutout();
    translate([-50,-100,-1]) cube([100,100,100]);
  }
}

module motorGearMountAssembled() {
  translate([0,0,9]) gear();
  motorGearMount();
}

module motorGearMount() {
  difference() {
    union() {
      gearMount();
      translate([0,0,-3]) cylinder(r=4,h=4);
    }
    color("red") translate([0,0,-3.5]) intersection() {
      cylinder(r=3,h=8.5);
      translate([-2,-3,0]) cube([4,6,8.5]);
    }
  }
}

module cutout() {
  difference() {
    union() {
      difference() { 
        color("green") translate([0,-0.5,8.5]) rotate([-90,0,0]) cylinder(r=9/2,h=3);
        color("orange") translate([0,-1,8.5]) rotate([-90,0,0]) cylinder(r=2.25,h=5);
      }
      color("red") translate([0,0,4]) cylinder(r=3.5,h=2);
      color("pink") translate([0,0,2.75]) cylinder(r=3,h=1.5);
      color("blue") translate([0,0,-0.5]) cylinder(r=2.5,h=1.5);
      color("yellow") translate([0,0,0.5]) cylinder(r=2.25,h=2);
      color("blue") translate([0,0,2]) cylinder(r=2.5,h=1.5);
    }
    color("purple") rotate([5,0,0]) translate([-5,2.6,-2]) cube([10,10,20]);
  }
}

