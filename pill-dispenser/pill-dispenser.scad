$fn=32;


use <../modules/hex-grid.scad>;
use <../modules/involute_gears.scad>;
use <./board-mount.scad>;

lw=0.4;
t=lw*2;

teethPerPill=3;
pillsPerRotation=8;

pr=3.5;
ph=21;

hexR=4.5;

bearingOuterR=11;

pillHoles=36;
a=10;
d=52;

pitch=3.5;
hub_thickness=4;
rim_thickness=4;
gear_thickness=2;

motorDistance=66;
motorAngle=45;

//rotate([0,0,0]) translate([50,0,0]) pill(pr,ph);
//rotate([0,0,10]) translate([50,0,0]) pill(pr,ph);

//color("red") translate([0,50,-16]) cube([10,10,50]);

translate([0,0,12]) {
 //carousel();
 //bigGear();
}
//carouselCap();

//bearingPost();
//translate([0,19.3,10]) rotate([90,0,0]) boardMount();
//mainMount();
translate([0,0,-16.5]) bottomLayer();
//translate([0,0,8.25]) mountRing();
//motorPosition() translate([8,0,11.25]) motorGear();

//driverMount();

module driverMount() {
  driverMountDX=27;
  driverMountDY=29.5;
  
  driverMountR=1;
  driverMountH=4.5;

  translate([-driverMountDX/2-2,-driverMountDY/2-2,0]) difference() {
    union() {
      translate([2,0,0]) cube([driverMountDX,driverMountDY+4,3]);
      translate([0,2,0]) cube([driverMountDX+4,driverMountDY,3]);
    }
    translate([3,3,-0.5]) cube([driverMountDX-2,driverMountDY-2,4]);
  }
  translate([driverMountDX/2,driverMountDY/2,0]) driverPeg();
  translate([-driverMountDX/2,driverMountDY/2,0]) driverPeg();
  translate([driverMountDX/2,-driverMountDY/2,0]) driverPeg();
  translate([-driverMountDX/2,-driverMountDY/2,0]) driverPeg();
}

module driverPeg() {
  cylinder(r=2,h=4.5);
  cylinder(r=1.25,h=7.5);
}

module bottomLayer() {
  translate([0,0,1.5]) rotate([0,0,45]) ring(4,90,52) {
    cylinder(r=3,h=13);
    translate([0,0,13]) cylinder(r=1.8,h=3.8);
  }
difference() {
  union() {
      translate([-60.5,0,14.5]) rotate([90,0,0]) intersection() {
          difference() {
            torus(8.5,pr+0.5+t*2.5);
            translate([0,0,-50]) cylinder(h=100,r=8.5);
          }
          translate([0,-100,-50]) cube([100,100,100]);
      }
 
   
      track(3);

     
      intersection() {
        hexGrid(10,3,t*2,11,11,[],[]);
        translate([0,0,-1]) cylinder(r=55.5,h=10.5);
      }
  }
   translate([-60.5,0,14.5]) rotate([90,0,0]) torus(8.5,pr+0.5+t*1.5);
}
  //track(3);
 
}

module track(h) {
  difference() {
    cylinder(r=55.5,h=h);
    translate([0,0,-0.5]) cylinder(r=49,h=h+1);
  } 
}

module mountRing() {
  difference() {
    union() {
      track(3.5);
      translate([-52,0,0]) cylinder(r=pr+0.5+t*2,h=3.5);
    }
    translate([-52,0,-0.5]) cylinder(r=pr+0.5+t,h=9);
    translate([0,-9,-0.5]) cube([100,18,1.5]);
  }
  translate([0,0,-3.8]) rotate([0,0,45]) ring(4,90,52) cylinder(r=1.8,h=3.8);

}

module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn/2);
}

module mainMount() {
  skipCells=[
    [10,5],[10,6],
    [11,4],[11,5],[11,6],
    [12,4],[12,5],[12,6],[12,7],

    [3,1],[9,1],
    [4,1],[4,2],[5,2],[6,3],[7,2],[8,1],[8,2],
    [5,1],[5,0],
    [6,2],[6,1],
    [7,1],[7,0],

    [3,9],
    [4,9],[4,10],
    [5,8],[5,9],[5,10],
    [6,8],[6,9],[6,10],
    [7,8],[7,9],[7,10],
    [8,9],[8,10],
    [9,9],

    [2,5],[2,6],
    [1,4],[1,5],[1,6],
    [0,4],[0,5],[0,6],[0,7],
  ];
  difference() { 
    union() {
      intersection() {
        translate([0,0,4]) hexGrid(5.35,4,t,13,11,skipCells,[]);
        cylinder(r=55.5,h=10.5);
      }
      translate([-52,0,4]) cylinder(r=pr+0.5+t*2,h=4);
      translate([0,0,4]) track(4);
    }
    translate([0,0,-1]) cylinder(r=bearingOuterR+4,h=10);
    motorPosition() translate([0,0,-1]) cylinder(r=22,h=11);
    translate([-52,0,-0.5]) cylinder(r=pr+0.5+t,h=9);
    translate([0,0,-0.5]) rotate([0,0,45]) ring(4,90,52) cylinder(r=2,h=9);
  }

  bearingHole();

  motorPosition() rotate([0,0,90]) motorMount();
}



module motorGear() {
		rotate([0,0,180/(teethPerPill*pillsPerRotation)]) difference() {
        gear (number_of_teeth=teethPerPill*pillsPerRotation,
				circular_pitch=pitch,
				hub_diameter=8,
        hub_thickness=hub_thickness,
				rim_thickness=rim_thickness,
				gear_thickness=gear_thickness,
				rim_width=3);
        translate([0,0,-0.5]) motorPegHole();
      }
}

module bigGear() {
  gr=61.5;
	difference() {
    union() {
    cylinder(r=gr,h=1);
      translate([0,0,1]) gear (number_of_teeth=teethPerPill*pillHoles,
			 	circular_pitch=pitch,
	   	 	hub_diameter=15,
        hub_thickness=hub_thickness,
			 	rim_thickness=rim_thickness + 0.5,
			 	gear_thickness=1,
			 	rim_width=15);
    
    translate([0,0,rim_thickness+1.5])    cylinder(r=gr,h=1);

    } 
    translate([0,0,-1]) cylinder(r=52,h=10);
    translate([0,0,-1]) ring(pillHoles,360/pillHoles,52) cylinder(r=pr+0.6+t,h=ph+2);
  }

}


module motorPegHole() {
  pw=3.2;
  pr=2.7;
  ph=7;

  intersection() {
    cylinder(r=pr,h=ph);
    translate([-pw/2,-pr,0]) cube([pw,pr*2,ph]);
  }
}

module ring(c,a,d) {
  for ( i = [0 : c] ) rotate([0,0,i*a]) translate([d,0,0]) children();
}

module motorPosition() {
  /* rotate([0,0,motorAngle]) */ translate([motorDistance,0,0]) children();
}

module carouselCap() {
  difference() {
    ring(pillHoles,360/pillHoles,52) cylinder(r=pr+0.6+t*2,h=8);
    translate([0,0,t]) ring(pillHoles,360/pillHoles,52) cylinder(r=pr+0.6+t,h=ph+2);
    translate([0,0,t]) cylinder(r=52,h=8);

  }
}


module carousel() {
  difference() {
    union() {
      ring(pillHoles,360/pillHoles,52) cylinder(r=pr+0.5+t,h=ph);

      intersection() {
        hexGrid(hexR,4,t,15,13,[],[]);
        cylinder(r=52,h=10);
      }
    }
    translate([0,0,-1]) ring(pillHoles,360/pillHoles,52) cylinder(r=pr+0.5,h=ph+2);
  }
}


module bearingPost() intersection() {
  union() {
    cylinder(r=4,h=7);
    translate([0,0,7]) cylinder(r=6,h=3);
    translate([0,0,10]) cylinder(r=hexCircumradius(hexR-t),h=5,$fn=6);
  }
  translate([-50,0.1,0]) cube([100,100,100]);
}

module bearingHole() {
  difference() {
    cylinder(r=bearingOuterR+5,h=8);
    translate([0,0,-1]) cylinder(r=bearingOuterR+0.75,h=10);
  }
  ring(7,45,bearingOuterR+0.75) cylinder(r=1,h=8);
}

module hexPost() {
  cylinder(r=hexCircumradius(hexR-t-0.2),h=5,$fn=6);
  translate([0,0,5]) cylinder(r=hexR,h=5);
}

module pill(r,h) {
  translate([0,0,r]) {
    sphere(r=r);
    cylinder(r=r,h=h-r*2);
    translate([0,0,h-r*2]) sphere(r=r);
  }
}

module pillBox() {
  t=2;
  w=140;
  h=45;
  translate([-w/2,-w/2,0]) {
    difference() {
      cube([w+t*2,w+t*2,h+t]);
      translate([t,t,t]) cube([w,w,h+t]);
    }
  }
}

module motorMount() {
  difference() {
    cylinder(r=22,h=8);
    
    translate([-9,-3,-0.5]) cube([18,20,10]);
    translate([-4,-3,4.5]) cube([8,25,10]);
    translate([35/2,0,0]) screwHole();
    translate([-35/2,0,0]) screwHole();
    translate([0,0,-0.5]) cylinder(r=14.5,h=10);
  }
 
}

module screwHole() {
  translate([0,0,-0.5]) {
    cylinder(r=2,h=10);
    rotate([0,0,90]) cylinder(r=3.1,h=3,$fn=6);
  }
}