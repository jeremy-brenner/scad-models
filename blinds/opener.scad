$fn=32;

include <./involute_gears.scad>;



//cylinder(r=2.25, h=11); //key

// intersection() {
//   cutout();
//   translate([-50,0,0]) cube([100,100,100]);
// }


//keyedGear();


//motorGearMount();
//blindGearMount();

//translate([0,2.75,20.5]) gearBoxClip();
assembled(); 
//gearBox();

//translate([0,2.75,25.5]) 
module gearBoxClip() {
  r=8.5;
  d=18;
  h=10;
  t=2;
  difference() {
    union() {
      translate([-d/2,0,0]) cylinder(r=r+t,h=h);
      translate([d/2,0,0]) cylinder(r=r+t,h=h);
      translate([-d/2,-r-t,0]) cube([d,(r+t)*2,h]);
    }
    translate([0,0,-0.5]) union() {
      translate([-d/2,0,0]) cylinder(r=r,h=h+1);
      translate([d/2,0,0]) cylinder(r=r,h=h+1);
      translate([-d/2,-r*2,0]) cube([d,r*3,h+1]);
      translate([0,t+r+1,h/2+0.5]) rotate([90,0,0]) cylinder(r=4.2, h=t+2);
    }
  }
}

module gearBox() {
  difference() {
    union() {
      gearCase();
      translate([0,-5.65,25.4]) rotate([25,0,0]) rotate([0,180,0]) gearCase();
    }
    translate([0,-50,-50]) cube([100,100,100]);
  }
}

module gearCase() {
  difference() {
    translate([0,2.75,8.5]) {
      difference() {
        arch(17,9);
        translate([0,0,2]) arch(14,9.5);
        translate([0,9,17]) rotate([90,0,0]) cylinder(r=4.2, h=18);
      }
      translate([0,12.5,17]) rotate([90,0,0]) spacer();
    }
    halfCube();
  }
}

module halfCube() {
  rotate([25/2,0,0]) translate([-25,-25,-37]) cube([50,50,50]);
}

module arch(h,ir) {
  translate([0,0,h]) rotate([90,0,0]) {
    rotate_extrude(convexity = 10)
      translate([ir, 0, 0])
      circle(r = h/2);
    translate([0,0,-h/2]) cylinder(r=ir,h=h);
  }
  translate([ir,0,0]) cylinder(r=h/2,h=h);
  translate([-ir,0,0]) cylinder(r=h/2,h=h);
  translate([-ir,-h/2,0]) cube([ir*2,h,h]);
}


module panel(l,s=0) {
  rotate([90,0,0]) difference() {
    translate([-7.5,-l/2-s,0]) cube([15,l,2]);
    translate([0,0,-0.5]) cylinder(r=4.2, h=3);
  }
}

module assembled() {
  rotate([-65,0,0]) translate([0,0,-1.25]) blindGearAssembled();
  translate([0,-6.75,25.5]) rotate([-90,0,0]) rotate([0,0,360/40]) motorGearMountAssembled();
  gearBox();
}

module spacer() {
  translate([0,0,5]) difference() {
    cylinder(r=7.5, h=2.5);
    translate([0,0,-0.5]) cylinder(r=4.2, h=7);
  }
}

module blindGearAssembled() {
  blindGearMount();
  rotate([0,0,180]) blindGearMount();
  translate([0,0,9]) gear();
}

module keyedGear() {
  keyW=15.2;
  keyT=3.2;
  difference() {
    gear();
    translate([-keyT/2,-keyW/2,-0.5]) cube([keyT,keyW,15]);
    translate([0,0,-0.5]) cylinder(r=5.75, h=10);
  }
}

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


module gear() {
  bevel_gear (
        number_of_teeth=20,
        cone_distance=50,
        face_width=5,
        outside_circular_pitch=205,
        pressure_angle=30,
        clearance = 0.2,
        bore_diameter=5,
        gear_thickness = 15,
        backlash = 0,
        involute_facets=0,
        finish = -1);
}

module cutout() {
  difference() {
  union() {
  //color("pink") translate([0,-0.5,8.5]) rotate([-90,0,0]) cylinder(r=10/2,h=1.5);

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

