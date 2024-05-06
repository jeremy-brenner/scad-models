$fn=64;

//28,10
poleR=10;



// clip();

// buckleHalf();

// translate([0,40,0]) buckleBottom();

// translate([0,0,1]) mirror([0,0,1]) 
//  buckleTop();



// buckle();

// mirror([0,0,1]) translate([20,-5,4]) button();

buttonCap();

//barClamp();
// difference() {
//   cylinder(r=4,h=6);
//   screwHole(23,true);
// }

module barClamp() {
  h=20;
  ir=11;
  ga=30;

  translate([0,0,-10]) intersection() {
    difference() {
      cylinder(r=ir+3,h=h);
      translate([0,0,-0.1]) cylinder(r=ir,h=h+0.2);
    }
    union() {
      translate([-1000,0,0]) cube([2000,1000,1000]);
      rotate([0,0,ga]) translate([-1000,-1000,0]) cube([2000,1000,1000]);
    }
  }
  translate([-10-ir-3,3,0]) mirror([1,0,0]) rotate([90,0,0]) tabThing(3);
  rotate([0,0,ga]) translate([-10-ir-3,0,0]) mirror([1,0,0]) rotate([90,0,0]) tabThing(3);
}

module buttonCap() {
  hull() {
    translate([-7,-7,0]) cylinder(r=4,h=2);
    translate([7,7,0]) cylinder(r=4,h=2);
    translate([-7,7,0]) cylinder(r=4,h=2);
    translate([7,-7,0]) cylinder(r=4,h=2);
  }
  translate([-7.5/2,1.25,2]) {
    cube([7.5,1.6,5.5]);
    translate([0,1.6,4.3]) rotate([0,90,0]) scale([1.2,1,1]) cylinder(r=1,h=7.5);
  }
  mirror([0,1,0]) translate([-7.5/2,1.25,2]) {
    cube([7.5,1.6,5.5]);
    translate([0,1.6,4.3]) rotate([0,90,0]) scale([1.2,1,1]) cylinder(r=1,h=7.5);
  }
  // translate([0,-7/2,0]) color("red") cube([1,7,3]);
}


module button() {
  translate([3,0,0]) {
    difference() {
      union() {
        cube([10,10,6]);
        translate([(10-2.8)/2,(10-21.5)/2,0]) cube([2.8,21.5,6]);
      }
      translate([1.2,1.5,0.1]) cube([7.6,7,6.1]);
      translate([1.2,1.5,2]) {
        rotate([0,90,0]) cylinder(r=1,h=7.6);
        translate([0,7,0])rotate([0,90,0]) cylinder(r=1,h=7.6);
      }
    }
  }
  mirror([0,0,1]) hull() {
    cube([16,10,0.5]);
    translate([10,0,0]) cube([0.2,10,4]);
  }
}

module buckle() {
color("grey") {
  translate([0,-11,2.1]) {
    cube([40,22,2.5]);
    translate([-10,-10,0]) cube([10,42,2.5]);
  }
}
}


module buckleTop() {
  difference() {
    buckleHalf(false);
    translate([22.6,-5.25,-10]) {
      cube([10.5,10.5,10.1]);
      translate([3.75,-5.75,0]) cube([3,22,10.1]);
      
      translate([-3,0,4]) cube([16.5,10.5,10.1]);
    }
  }
      
  difference() {
    union() {
      translate([2.9+35.4/2,-10,0]) cylinder(r=6,h=1.5);
      translate([2.9+35.4/2,10,0]) cylinder(r=6,h=1.5);
    }
    translate([-0.1,-11,-0.1]) cube([42,22,1.7]);
  }

}

module buckleBottom() {
  difference() {
    buckleHalf(true);
    translate([2.9,-10.2,-3.7]) {
      cube([35.4,20.4,3.8]);
      translate([35.4/2,0.2,0]) cylinder(r=6.2,h=3.8);
      translate([35.4/2,20.2,0]) cylinder(r=6.2,h=3.8);

    }
    translate([6,-6,-6]) {
      cube([30,12,6.1]);
      translate([20,0,-1]) cube([10,12,7.1]);
    }

  }
}

module buckleHalf(nut=false) {
  bz=8;

  difference() {
    hull() {
      translate([40,14,-bz]) cylinder(r=5,h=bz);
      translate([40,-14,-bz]) cylinder(r=5,h=bz);
      translate([5,14,-bz]) cylinder(r=5,h=bz);
      translate([5,-14,-bz]) cylinder(r=5,h=bz);
    }

    translate([40,14,-bz]) screwHole(bz,nut);
    translate([40,-14,-bz]) screwHole(bz,nut);
    translate([5,14,-bz]) screwHole(bz,nut);
    translate([5,-14,-bz]) screwHole(bz,nut);
    translate([-0.1,-11,-1.5]) cube([42,22,1.6]);
    translate([0,-10.5,-1.5]) cylinder(r=2,h=1.6);
    translate([0,10.5,-1.5]) cylinder(r=2,h=1.6);
  }
  translate([45+10,0,-bz]) tabThing(4);
}

module tabThing(t) {
  difference() {
    union() {
      cylinder(r=10,h=t);
      translate([-11,-10,0]) cube([11,20,t]);
    }
    translate([0,0,-0.1]) cylinder(r=3.2,h=t+0.2);
  }
}

module screwHole(h,nut) {
  translate([0,0,-0.1]) {
    cylinder(r=1.7,h=h+0.2);
    if(!nut) {
      cylinder(r=3,h=3);
    }else{
      cylinder(r=3,h=3,$fn=6);
    }
  }
}

module clip() {
  clipH=5;
  translate([3,-10,-3.5]) difference() {
    union() {
      difference() {
        cube([35,20,2]);
        translate([4,4,-0.1]) cube([28,12,2.2]);
      }
      translate([4,5,0]) hull() {
        cube([27,10,2]);
        translate([26.9,0,0]) cube([0.1,10,clipH]);
      }
      difference() {
        union() {
          translate([35/2,20,0]) cylinder(r=6,h=2);
          translate([35/2,0,0]) cylinder(r=6,h=2);
        }
        translate([0,0,-0.1]) cube([100,20,2.2]);
      }
    }
    translate([4,5,-0.1]) cylinder(r=1.5,h=10.1);
    translate([4,15,-0.1]) cylinder(r=1.5,h=10.1);
  }
  
}
