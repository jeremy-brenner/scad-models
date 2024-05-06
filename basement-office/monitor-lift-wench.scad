use <./monitor-lift-motor-60ktyz.scad>
use <../modules/involute_gears.scad>
use <./monitor-lift-poles.scad>;

$fn=64;

// d = 1000


// spoolR=37.5;
// sideR=spoolR+15;
//235.6194 per rot
// 4.25 rots
// 5rpm = 51s
// 10rmp = 25s

spoolR=23;
sideR=spoolR+20;
poleD=21;
//144.5133 per rot
// 6.9 rots
// 5rmp = 1m 23s
// 10rmp = 41s

// spoolR=27
//169.646 per rot
// 5.9 rots
// 10rpm = 35.4s

//spoolR=32
// 201.06 per rot
// 5 rots
// 10 rpm = 30s


spoolW=25;

centerPostR=7;

sideW=5;

screwR=2;
screwD=15;

protrusionH=8.5;
protrusionR=10;

brakePos=-55;

brakeW=72;
brakeRodInset=10;

// translate([0,0,-31.5]) rotate([0,0,90]) centerPost();

  // translate([0,-10,0]) rotate([0, -90,0]) centerPostTop();
  // translate([0,10,0]) rotate([0,0,180]) rotate([0, 90,0]) centerPostBottom();

// translate([0,0,-3]) {
  // centerPostTop();
  //  centerPostBottom();
// }
// mirror([0,0,1]) translate([0,0,spoolW/2]) spoolSide();

// translate([spoolR-8,0,0]) cordPost();
// cordPostCap();
//  translate([0,0,-spoolW/2]) spoolCenter();
//  translate([0,0,spoolW/2]) spoolSide(true);

// brakeGearPad(39);
// brakeGearPad(31);
// brakeGearPad(23);

  translate([brakePos,0,30.5]) {
     brake(0);
  // //    brakeGearPad(39);
  }  
  mirror([0,1,0]) mirror([1,0,0]) translate([brakePos,0,30.5]) {
    brake(1);
  // //   brakeGearPad(39);
  }
// translate([0,0,20]) brakeGear();

// mountPoles();

// translate([0,0,35]) bearingMount();
// translate([0,0,38]) bearingClamp();


//  translate([0,0,-33]) rotate([0,0,45]) rotate([0,0,90]) liftMotor(-45);
 
//  translate([0,0,-49]) motorMount();


//  translate([56,0,0]) cableRoller();


 
// translate([20,0,0]) rollerClampSide(true);

// brakeBarBracket();


module mountPoles() {
  translate([63,200,0]) rotate([90,0,0]) rotate([0,-90,0])  translate([0,-poleD/2,0]) poles(poleD);
}

module brakeBarBracket() {
  //60
  difference() {
    union() {
      translate([0,16,3]) rotate([0,90,0]) cylinder(r=3.5,h=2);
      translate([0,-16,3]) rotate([0,90,0]) cylinder(r=3.5,h=2);
      translate([0,16-3.5,0]) {
        translate([0,0,3]) cube([2,7,7]);
        translate([0,0,8]) cube([66,7,2]);
        translate([60,0,8]) cube([6,7,3.5]);
      }
      translate([0,-16-3.5,0]) {
        translate([0,0,3]) cube([2,7,7]);
        translate([0,0,8]) cube([66,7,2]);
        translate([60,0,8]) cube([6,7,3.5]);
      }
      
    }
    translate([-0.1,16,3]) rotate([0,90,0]) cylinder(r=1.7,h=2.2);
    translate([-0.1,-16,3]) rotate([0,90,0]) cylinder(r=1.7,h=2.2);
  }
  translate([60,-brakeW/2,11.5]) difference() {
    cube([6,brakeW,7]);
    translate([-1,brakeRodInset,3.5]) rotate([0,90,0]) cylinder(r=2.2,h=4);
    translate([-1,brakeW-brakeRodInset,3.5]) rotate([0,90,0]) cylinder(r=2.2,h=4);
  }

}

module rollerClampSide() {
  difference() {
    translate([0,0,7.7]) rotate([0,0,90]) rotate([0,90,0]) difference() {
      union() {
        hull() {
          cylinder(r=7.7, h=8);
          translate([0,-7.7,0]) cube([27.75,7.7*2,8]);
          translate([2.75,5.5,31]) color("red") cube([25,2,1]);
        } 
        translate([9.75,-7.7,-17]) cube([18,7.7*2,21]);
      }
      
      translate([0,0,-0.1]) cylinder(r=5.6, h=5.1);
      translate([0,0,-0.1]) cylinder(r=4, h=7.1);
    }
    translate([-50,-17+poleD/2,0]) hull() mirror([0,1,0]) poles(0);
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
    translate([0,0,11]) {
      cw=12;
      translate([-5,-cw/2,0]) cube([5,cw,2]);
      translate([-7,-cw/2,-2]) cube([2,cw,4]);
      translate([0,0,0]) cylinder(r=cw/2,h=2);
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
  difference() {
    union() {
      translate([0,dist,0]) mountPost(14);
      mirror([0,1,0]) translate([0,dist,0]) mountPost(14);
      translate([65,-60,0]) difference() {
        translate([0,brakeW/3-2,-35]) cube([18,brakeW+2,49]);
        translate([-1,60-brakeW/2+brakeRodInset,-5]) rotate([0,90,0]) cylinder(r=2.2,h=11);
        translate([-1,60+brakeW/2-brakeRodInset,-5]) rotate([0,90,0]) cylinder(r=2.2,h=11);
      }
      difference() {
        translate([-5,-dist,0]) cube([18,dist*2,14]);

        translate([-5.1,16,7]) rotate([0,90,0]) {
          cylinder(r=1.7,h=100.2);
          translate([0,0,15.2]) cylinder(r=3.2,h=3,$fn=6);
        }
        translate([-5.1,-16,7]) rotate([0,90,0]) {
          cylinder(r=1.7,h=100.2);
          translate([0,0,15.2]) cylinder(r=3.2,h=3,$fn=6);
        }

        translate([0,0,3]) {
          cylinder(r=11.2, h=8);
          translate([-20,-11.2,0]) cube([20,22.4,8]);
          translate([0,0,-50]) cylinder(r=5,h=100);
          translate([-20,-5,-50]) cube([20,10,100]);
        }
      }
    }
    translate([60,36,-3]) rotate([0,90,0]) cylinder(r=3,h=30);

    translate([0,0,-35]) mountPoles();
    
    translate([74,-20,15.1]) mirror([0,0,1]){
      cylinder(r=6,h=25.2);
      translate([0,11,22]) mirror([0,1,0]) rotate([90,0,0]) poleScrewHole();
    }

    translate([74,20,15.1]) mirror([0,0,1]) {
      cylinder(r=6,h=25.2);
      translate([0,11,22]) mirror([0,1,0]) rotate([90,0,0]) poleScrewHole();
    }

  }


  translate([83,41,12]) mirror([1,0,0]) rotate([90,0,0]) rotate([0,90,0]) difference() {
      union() {
        translate([-8, 0,10 ]) cube([26,2,44]);
        translate([-8,-6,10]) cube([26,6,2]);
        translate([16,-1,10]) cube([2,3,44]);
        translate([8,-1,10]) cube([2,3,44]);
        translate([0,-1,10]) cube([2,3,44]);
        translate([-8,-6,52]) cube([26,6,2]);
      }

      translate([5,0,24]) rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=1.7,h=8.2);
      translate([5,0,44]) rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=1.7,h=8.2);
      translate([13,0,24]) rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=1.7,h=8.2);
      translate([13,0,44]) rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=1.7,h=8.2);
    }

  translate([63,-45.5,-18]) rotate([0,0,-90]) rotate([90,0,0]) rollerClampSide();
}

module motorMount() {
  dist=35.5;
  
  difference() {
    union() {
      translate([0,dist,0]) mountPost(14);
      translate([dist,0,0]) mountPost(14);
      mirror([0,1,0]) translate([0,dist,0]) mountPost(14);
      translate([65,-60,0]) difference() {
        union() {
          translate([0,brakeW/3/2-0.5,0]) cube([18,brakeW*1.35,14]);
          translate([0,brakeW/3-2,0]) cube([18,brakeW+2,49]);
        }
        translate([-1,60-brakeW/2+brakeRodInset,-4.75]) rotate([0,90,0]) cylinder(r=2.2,h=11);
        translate([-1,60+brakeW/2-brakeRodInset,-4.75]) rotate([0,90,0]) cylinder(r=2.2,h=11);
      }
    }
    translate([0,0,-1]) cylinder(r=30.5,h=100);
    translate([0,0,-0.1]) rotate([0,0,45]) {
      translate([50/2,50/2,0]) {
        translate([0,0,-0.1]) cylinder(r=4.2,h=3.1,$fn=6);
        translate([0,0,14-2.4]) cylinder(r=3.25,h=2.6);
        cylinder(r=2.25,h=14.2);
      }
      translate([50/2,-50/2,0]) {
        translate([0,0,-0.1]) cylinder(r=4.2,h=3.1,$fn=6);
        translate([0,0,14-2.4]) cylinder(r=3.25,h=2.6);
        cylinder(r=2.25,h=14.2);
      }
      translate([-50/2,-50/2,0]) {
        translate([0,0,-0.1]) cylinder(r=4.2,h=3.1,$fn=6);
        translate([0,0,14-2.4]) cylinder(r=3.25,h=2.6);
        cylinder(r=2.25,h=14.2);
      }
    }
    translate([83,-60,-1]) cube([50,120,22]);
    translate([0,0,49]) mountPoles();
    

    translate([74,-20,-0.1]) {
      cylinder(r=6,h=25.2);
      translate([0,11,25]) mirror([0,1,0]) rotate([90,0,0]) poleScrewHole(true);
    }

    translate([74,20,-0.1]) {
      cylinder(r=6,h=25.2);
      translate([0,11,25]) mirror([0,1,0]) rotate([90,0,0]) poleScrewHole(true);
    }
        
    
  }
  
  translate([63,-45.5,32]) 
  mirror([0,0,1])
  rotate([0,0,-90]) 
  rotate([90,0,0]) rollerClampSide();

}

module mountPost(mountPostT=20) {
  mountPostW=10;
  difference() {
    union() {
      cylinder(r=mountPostW/2,h=mountPostT);
      rotate([0,0,-6.5]) translate([0,-mountPostW/2,0]) cube([70,mountPostW,mountPostT]); 
      rotate([0,0,6.5]) translate([0,-mountPostW/2,0]) cube([70,mountPostW,mountPostT]);
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
    translate([0,-padW/2,4]) cube([25,padW,protrusionH]);

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
    translate([0,0,-6]) brakeGearPadHoles();

  }
}

module springHook() {
  translate([0,-brakeW/2-4,0.5]) {
    translate([-1,0,0]) cube([3,4,2.5]);
    translate([-3,0,0]) cube([4,2,2.5]);
    translate([-3,2,0]) cube([1,1,2.5]);
  }
}

module brake(side=0) {
  brakeSideW=brakeW/2-18.5;  
  difference() {
    union() {
      translate([0,-brakeW/2,-4]) cube([30,brakeW,7]);
      translate([39.3,-brakeW/2+brakeSideW-0.6+2,-4]) rack(number_of_teeth=20, diametral_pitch=0.80, pressure_angle=25, rim_width=brakeSideW,rim_thickness=7);
      hookD=14;
      if(side==1) {
        translate([38,-brakeW/2-18,0.5]) difference() {
          cube([7,19,2.5]);
          translate([3.5,4,-0.1]) cylinder(r=2.2,h=2.7);
        }
        translate([76.5-hookD,0,0]) springHook();
      }
      if(side==0) {
        mirror([0,1,0]) translate([28-hookD,0,0]) springHook();
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
  extra = teeth ? 0 : 1.5;
  difference() {
    union() {
      cylinder(r1=sideR, r2=sideR+sideW,h=sideW);
      cylinder(r=protrusionR,h=protrusionH+sideW+extra);
      if(teeth) translate([0,0,sideW]) gear(
        number_of_teeth=70,
        circular_pitch=4,
        bore_diameter=2,
				hub_diameter=4,
				rim_width=8,
				hub_thickness=0,
				rim_thickness=protrusionH,
				gear_thickness=3
      );
    }
    translate([0,0,-0.1]) rotate([0,0,30]) cylinder(r=centerPostR+0.2,h=protrusionH+sideW+extra+0.2,$fn=6);
    translate([0,screwD,-0.1]) cylinder(r=screwR+0.2,h=protrusionH+sideW+extra+0.2);
    translate([0,-screwD,-0.1]) cylinder(r=screwR+0.2,h=protrusionH+sideW+extra+0.2);
    if(!teeth) {
      translate([0,screwD,2]) cylinder(r=4+0.2,h=3.1, $fn=6);
      translate([0,-screwD,2]) cylinder(r=4+0.2,h=3.1, $fn=6);
      translate([-protrusionR,0,(protrusionH+sideW+extra)-(protrusionH+extra)/2]) rotate([0,90,0]) {
        cylinder(r=1.7,h=protrusionR*2);
        rotate([0,0,90]) cylinder(r=3.2,h=3,$fn=6);
      }
    }
  }



}

module spoolCenter() {
  difference()  {
    cylinder(r=spoolR,h=spoolW);
    translate([spoolR-8,-2.5,-0.1]) cube([10,5,spoolW+0.2]);
    translate([spoolR-8,0,-0.1]) cylinder(r=7.5,h=spoolW+0.2);
    translate([0,0,-0.1]) rotate([0,0,30]) cylinder(r=centerPostR+0.2,h=spoolW+0.2,$fn=6);
    translate([0,screwD,-0.1]) cylinder(r=screwR+0.2,h=spoolW+0.2);
    translate([0,-screwD,-0.1]) cylinder(r=screwR+0.2,h=spoolW+0.2);
  }
}

module centerPost() {
  h=57.75;
  difference() {
    cylinder(r=centerPostR,h=h, $fn=6);
    translate([0,0,-1]) difference() {
      cylinder(r=3.75,h=19);
      translate([-50,-3.75,4]) cube([100,0.75,15]);
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