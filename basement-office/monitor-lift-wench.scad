use <./monitor-lift-motor.scad>
use <../modules/involute_gears.scad>

$fn=64;

spoolR=37.5;
spoolW=25;

centerPostR=10;

sideR=spoolR+15;
sideW=5;

screwR=2;
screwD=25;

protrusionH=16;
protrusionR=15;

brakePos=-55;

brakeW=72;
brakeRodInset=10;

// translate([0,0,-24]) rotate([0,0,90]) liftMotor();


// translate([0,0,-3]) {
  // centerPostTop();
//   centerPostBottom();
// }
// mirror([0,0,1]) spoolSide();

//translate([22.5,0,0]) cordPost();
// cordPostArm();
// cordPostCap();
// spoolCenter();
// translate([0,0,spoolW]) spoolSide(true);

// brakeGearPad(39);
// brakeGearPad(31);
// brakeGearPad(23);

  // translate([brakePos,0,47]) {
  //    brake(0);
  //    brakeGearPad(24);
  // }  
  // mirror([0,1,0]) mirror([1,0,0]) translate([brakePos,0,47]) {
    // brake(1);
    // brakeGearPad(24);
  // }
// translate([0,0,20]) brakeGear();


// translate([0,0,50]) bearingMount();
translate([0,0,56]) bearingClamp();



//bearing
// color("blue") translate([0,0,6]) cylinder(r=11, h=8);

// bearing();


//  translate([0,0,-45.5]) motorMount();


//cableRoller();
//  rollerClamp();

// brakeBarBracket();
module brakeBarBracket() {
  //60
  difference() {
    union() {
      translate([0,16,0]) rotate([0,90,0]) cylinder(r=3.5,h=2);
      translate([0,-16,0]) rotate([0,90,0]) cylinder(r=3.5,h=2);
      translate([0,16-3.5,0]) {
        cube([2,7,10]);
        translate([0,0,8]) cube([66,7,2]);
        translate([60,0,8]) cube([6,7,3.5]);
      }
      translate([0,-16-3.5,0]) {
        cube([2,7,10]);
        translate([0,0,8]) cube([66,7,2]);
        translate([60,0,8]) cube([6,7,3.5]);
      }
      
    }
    translate([-0.1,16,0]) rotate([0,90,0]) cylinder(r=1.7,h=2.2);
    translate([-0.1,-16,0]) rotate([0,90,0]) cylinder(r=1.7,h=2.2);
  }
  translate([60,-brakeW/2,11.5]) difference() {
    cube([6,brakeW,7]);
    translate([-1,brakeRodInset,3.5]) rotate([0,90,0]) cylinder(r=2.2,h=4);
    translate([-1,brakeW-brakeRodInset,3.5]) rotate([0,90,0]) cylinder(r=2.2,h=4);
  }

}

module brakeMotorBracket() {
  difference() {
    union() {
      cube([18,2,50]);
      cube([18,20,2]);
      cube([1.5,4,50]);
      cube([1.5,20,4]);

      translate([16.5,0,0]) {
        cube([1.5,4,50]);
        cube([1.5,20,4]);
      }
    }
    translate([18-5,7,-0.1]) cylinder(r=1.7,h=2.2);
    translate([5,20-5,-0.1]) cylinder(r=1.7,h=2.2);

    translate([5,0,24]) rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=1.7,h=2.2);
    translate([5,0,44]) rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=1.7,h=2.2);
    translate([13,0,24]) rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=1.7,h=2.2);
    translate([13,0,44]) rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=1.7,h=2.2);
  }
}

module rollerClamp() {
  difference() {
    union() {
      cylinder(r=7.7, h=7);
      translate([6.7,12,2]) rotate([0,90,0]) cylinder(r=5,h=3);
      translate([6.7,-12,2]) rotate([0,90,0]) cylinder(r=5,h=3);

      translate([0,-7.7,0]) cube([7.7,7.7*2,7]);
      translate([7.7,(7.7*2+8)/-2,0]) cube([2,7.7*2+8,7]);
    }
    translate([0,0,-0.1]) cylinder(r=5.6, h=4.1);
    translate([0,0,-0.1]) cylinder(r=4, h=6.1);
        
    rotate([0,90,0]) translate([-2,12,-0.1]) cylinder(r=2.2, h=50);
    rotate([0,90,0]) translate([-2,-12,-0.1]) cylinder(r=2.2, h=50);


  }
}
  

module bearing() {
  color("silver") translate([0,0,6]) difference() {
    cylinder(r=11, h=8);
    translate([0,0,-0.1]) cylinder(r=4,h=8.2);
  }
}

module bearingClamp() {
    intersection() {
      translate([-15,-40,0]) cube([10,80,10]);
      difference() {
        union() {
          cylinder(r=13.2, h=10);
          translate([-9,-16,0]) {
            translate([0,0,4]) rotate([0,90,0]) cylinder(r=4,h=2);
            translate([0,32,4]) rotate([0,90,0]) cylinder(r=4,h=2);
            cube([2,32,8]);
          }
        }

        translate([0,0,-0.1]) cylinder(r=11.2, h=8.2);
        translate([-50,16,4]) rotate([0,90,0]) cylinder(r=1.7,h=100.2);
        translate([-50,-16,4]) rotate([0,90,0]) cylinder(r=1.7,h=100.2);
      }
    }
    translate([0,0,12]) {
      translate([-5,-9.5/2,0]) cube([5,9.5,2]);
      translate([-7,-9.5/2,-2]) cube([2,9.5,4]);
      translate([0,0,0]) cylinder(r=9.5/2,h=2);
    }
}


module cableRoller() {
  mainR=spoolW/2+2;
  rScale=0.2;
  rotate_extrude() { 
    translate([-mainR*rScale-2-2.1,0]) difference() { 
      translate([0,-mainR-2]) square([mainR*rScale+2,mainR*2+4]);
      scale([rScale,1]) circle(r=mainR);
    }
  }
}


module bearingMount() {
  dist=25.5;
  translate([0,dist,0]) mountPost(false);
  mirror([0,1,0]) translate([0,dist,0]) mountPost(false);
  translate([65,-60,0]) difference() {
    union() {
      cube([10,120,20]);
      translate([0,60-brakeW/2-2,-8.5]) cube([10,brakeW+4,8.5]);
    }
    translate([-0.1,8,10]) rotate([0,90,0]) cylinder(r=2.2,h=10.2);
    translate([-0.1,112,10]) rotate([0,90,0]) cylinder(r=2.2,h=10.2);
    translate([-1,60-brakeW/2+brakeRodInset,-4.75]) rotate([0,90,0]) cylinder(r=2.2,h=100);
    translate([-1,60+brakeW/2-brakeRodInset,-4.75]) rotate([0,90,0]) cylinder(r=2.2,h=100);
  }
  difference() {
    translate([-5,-dist,0]) cube([18,dist*2,20]);

    translate([-5.1,16,10]) rotate([0,90,0]) {
      cylinder(r=1.7,h=100.2);
      translate([0,0,15.2]) cylinder(r=3.2,h=3,$fn=6);
    }
    translate([-5.1,-16,10]) rotate([0,90,0]) {
      cylinder(r=1.7,h=100.2);
      translate([0,0,15.2]) cylinder(r=3.2,h=3,$fn=6);
    }

    translate([0,0,6]) {
      cylinder(r=11.2, h=8);
      translate([-20,-11.2,0]) cube([20,22.4,8]);
      translate([0,0,-50]) cylinder(r=5,h=100);
      translate([-20,-5,-50]) cube([20,10,100]);
    }
  }
}

module motorMount() {
  dist=30.5;
  translate([0,dist,0]) mountPost(true);
  mirror([0,1,0]) translate([0,dist,0]) mountPost(true);
  translate([65,-60,0]) difference() {
    cube([10,120,20]);
    translate([-0.1,8,10]) rotate([0,90,0]) cylinder(r=2.2,h=10.2);
    translate([-0.1,112,10]) rotate([0,90,0]) cylinder(r=2.2,h=10.2);
  }
}

module mountPost(screwHoles=false) {
  mountPostW=10;
  mountPostT=20;
  difference() {
    union() {
      cylinder(r=mountPostW/2,h=mountPostT);
      rotate([0,0,-6.5]) translate([0,-mountPostW/2,0]) cube([70,mountPostW,mountPostT]); 
      rotate([0,0,6.5]) translate([0,-mountPostW/2,0]) cube([70,mountPostW,mountPostT]);
    }
    if(screwHoles) {
      rotate([0,0,-6.5]) translate([13,-0.5,-1]) {
        cylinder(r=1.75, h=100);
        cylinder(r=3.2,h=3,$fn=6);
      }
      rotate([0,0,-6.5]) translate([19.5,-0.5,-1]) {
        cylinder(r=1.75, h=100);
        cylinder(r=3.2,h=3,$fn=6);
      }
      translate([13,-25-mountPostW/2,-1]) rotate([0,0,6.5]) cylinder(r=25,h=100);
    }
  }
}

module cordPost() {
  difference() {
    cylinder(r=5,h=spoolW);
     translate([0,0,-0.1]) cylinder(r=2.2,h=spoolW+0.2);
  }
}

module cordPostCap() {
  difference() {
    union() {
      difference() {
        cylinder(r=16,h=20); 
        translate([0,0,-0.1]) cylinder(r=14,h=20.2); 
      }
      translate([-7.5,-14,10]) cube([15,28,10]);
      difference() {
        cylinder(r=21.5,h=20); 
        translate([0,0,-0.1]) cylinder(r=19.5,h=20.2); 
      }
      translate([0,0,20]) cylinder(r=21.5,h=2); 
    }
    translate([0,50,10]) rotate([90,0,0]) cylinder(r=2.2, h=100);
    translate([0,13,10]) rotate([90,0,0]) cylinder(r=7.5, h=26);
    translate([-7.5,-13,-0.1]) cube([15,26,10.1]);
    translate([-2,-12.5,0]) cube([4,25,100]);
  }
}


module brakeGearPad(padW) {
  mirror([0,0,1]) difference() {
    translate([0,-padW/2,4]) cube([25,padW,protrusionH-1]);

    translate([55,0,-5]) linear_extrude(45) offset(r=0.2) projection(cut=false) gear(
        number_of_teeth=70,
        circular_pitch=4,
        bore_diameter=2,
        hub_diameter=80,
        rim_width=8,
        hub_thickness=40,
        rim_thickness=protrusionH+sideW,
        gear_thickness=3
      );
    brakeGearPadHoles();

  }
}


module brake(side=0) {
  brakeSideW=brakeW/2-16.5;  
  difference() {
    union() {
      translate([0,-brakeW/2+2,-4]) cube([30,brakeW,7]);
      translate([39.3,-brakeW/2+brakeSideW-0.6,-4]) rack(number_of_teeth=20, diametral_pitch=0.80, pressure_angle=25, rim_width=brakeSideW,rim_thickness=7);
      if(side==1) {
        translate([45,-brakeW/2-19,0.5]) difference() {
          cube([8,17,2.5]);
          translate([4,4,-0.1]) cylinder(r=2.2,h=2.7);
        }
        translate([76.5-13.5,-brakeW/2-6,1]) {
          translate([-1,0,0]) cube([3,4,2]);
          translate([-3,0,0]) cube([4,2,2]);
          translate([-3,2,0]) cube([1,1,2]);
        }
      }
      if(side==0) {
        mirror([0,1,0]) translate([14.5,-brakeW/2-6,1]) {
          translate([-1,0,0]) cube([3,4,2]);
          translate([-3,0,0]) cube([4,2,2]);
          translate([-3,2,0]) cube([1,1,2]);
        }
      }
    }
    translate([-1,-brakeW/2+brakeRodInset,-0.5]) rotate([0,90,0]) cylinder(r=2.2,h=100);
    translate([-1,brakeW/2-brakeRodInset,-0.5]) rotate([0,90,0]) cylinder(r=2.2,h=100);
    brakeGearPadHoles();
  }
}

module brakeGearPadHoles() {
  translate([4.5,6,-4.1]) cylinder(r=1.6,h=23.2);
  translate([4.5,6,13.1]) rotate([0,0,90]) cylinder(r=3.2,h=6,$fn=6);
  translate([4.5,-6,-4.1]) cylinder(r=1.6,h=100);
  translate([4.5,-6,13.1]) rotate([0,0,90]) cylinder(r=3.2,h=6,$fn=6);
}

module brakeGear() {
  translate([0,0,25]) difference() {
    union() {
      gear(
          number_of_teeth=28,
          circular_pitch=3.7,
          bore_diameter=2,
          hub_diameter=4,
          rim_width=7,
          hub_thickness=1,
          rim_thickness=7,
          gear_thickness=3
      );
      
    }
    translate([0,0,-0.1]) cylinder(r=11.2,h=7.2);
  }
}

module spoolSide(teeth=false) {
  difference() {
    union() {
      cylinder(r1=sideR, r2=sideR+sideW,h=sideW);
      cylinder(r=protrusionR,h=protrusionH+sideW);
      if(teeth) gear(
        number_of_teeth=70,
        circular_pitch=4,
        bore_diameter=2,
				hub_diameter=4,
				rim_width=8,
				hub_thickness=4,
				rim_thickness=protrusionH+sideW,
				gear_thickness=3
      );
    }
    translate([0,0,-0.1]) rotate([0,0,30]) cylinder(r=centerPostR+0.2,h=protrusionH+sideW+0.2,$fn=6);
    translate([0,screwD,-0.1]) cylinder(r=screwR+0.2,h=protrusionH+sideW+0.2);
    translate([0,-screwD,-0.1]) cylinder(r=screwR+0.2,h=protrusionH+sideW+0.2);
    if(!teeth) {
      translate([0,screwD,2]) cylinder(r=4+0.2,h=3.1, $fn=6);
      translate([0,-screwD,2]) cylinder(r=4+0.2,h=3.1, $fn=6);
      translate([-protrusionR,0,protrusionH+sideW-8]) rotate([0,90,0]) {
        cylinder(r=1.7,h=protrusionR*2);
        cylinder(r=3.2,h=3,$fn=6);
      }
    }
  }



}

module spoolCenter() {
  difference()  {
    cylinder(r=spoolR,h=spoolW);
    translate([spoolR-10,-2.5,-0.1]) cube([10,5,spoolW+0.2]);
    translate([spoolR-15,0,-0.1]) cylinder(r=7.5,h=spoolW+0.2);
    translate([0,0,-0.1]) rotate([0,0,30]) cylinder(r=centerPostR+0.2,h=spoolW+0.2,$fn=6);
    translate([0,screwD,-0.1]) cylinder(r=screwR+0.2,h=spoolW+0.2);
    translate([0,-screwD,-0.1]) cylinder(r=screwR+0.2,h=spoolW+0.2);
  }
}

module centerPost() {
  h=55;
  difference() {
    cylinder(r=centerPostR,h=h, $fn=6);
    translate([0,0,-1]) intersection() {
      cylinder(r=3.75,h=17);
      translate([-50,-2.75,0]) cube([100,100,17]);
    }
    translate([0,50,9]) rotate([90,0,0]) cylinder(r=1.75,h=100);

    translate([0,0,20]) cylinder(r=4.2,h=h);
  }
}

module centerPostTop() {
  translate([0,0,-19]) rotate([0,0,90]) intersection() {
    centerPost();
    translate([-25,-50,0]) cube([50,50,80]);
  }
}

module centerPostBottom() {
  translate([0,0,-19]) rotate([0,0,90]) intersection() {
    centerPost();
    translate([-25,0,0]) cube([50,50,80]);
  }
}